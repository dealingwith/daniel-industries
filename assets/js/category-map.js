(async function () {
  const container = document.getElementById("viz");
  container.style.width = "100%";
  container.style.height = "100vh";
  container.style.margin = "0";
  container.style.padding = "0";
  // Full-viewport canvas (adjust the 0 if you want to account for header/nav height)
  const width = Math.floor(window.innerWidth);
  const height = Math.floor(window.innerHeight);
  const dataUrl = container.dataset.graphUrl;
  const res = await fetch(dataUrl);
  const graph = await res.json();

  const details = document.getElementById("details");

  // Basic controls / thresholds
  const MAX_NODES = 80;         // avoid hairballs
  const MIN_EDGE_WEIGHT = 2;    // hide weak overlaps

  // Select top categories by frequency
  const nodes = graph.nodes.slice(0, MAX_NODES);
  const nodeSet = new Set(nodes.map(n => n.id));

  const edges = graph.edges
    .filter(e => nodeSet.has(e.source) && nodeSet.has(e.target))
    .filter(e => e.weight >= MIN_EDGE_WEIGHT);

  const byId = new Map(nodes.map(n => [n.id, n]));

  // adjacency: cat -> Set(neighbors)
  const neighbors = new Map(nodes.map(n => [n.id, new Set()]));
  for (const e of edges) {
    neighbors.get(e.source)?.add(e.target);
    neighbors.get(e.target)?.add(e.source);
  }

  // Scale helpers
  const maxCount = Math.max(...nodes.map(n => n.count));
  const maxW = edges.length ? Math.max(...edges.map(e => e.weight)) : 1;

  const cx = width / 2;
  const cy = height / 2;
  const R = Math.min(width, height) * 0.35;

  // Initial radial placement
  nodes.forEach((n, i) => {
    const angle = (i / nodes.length) * Math.PI * 2;
    n.x = cx + Math.cos(angle) * R;
    n.y = cy + Math.sin(angle) * R;
    n.r = 6 + 18 * (n.count / maxCount);
  });

  // Simple relaxation: pull connected nodes together, push all nodes apart a bit
  function relax(iterations = 400) {
    // Initialize velocities
    nodes.forEach(n => { n.vx = 0; n.vy = 0; });

    const dt = 0.02;          // timestep
    const damping = 0.85;     // velocity damping
    const kRep = 1200;        // repulsion strength
    const kLink = 0.06;       // edge spring strength
    const kCenter = 0.002;    // gentle pull to center

    for (let step = 0; step < iterations; step++) {
      // Net forces
      const fx = new Map(nodes.map(n => [n.id, 0]));
      const fy = new Map(nodes.map(n => [n.id, 0]));

      // Repulsion (all-pairs) — stable magnitude
      for (let i = 0; i < nodes.length; i++) {
        for (let j = i + 1; j < nodes.length; j++) {
          const a = nodes[i], b = nodes[j];
          let dx = a.x - b.x, dy = a.y - b.y;
          const dist2 = dx * dx + dy * dy + 25; // soften close-range
          const dist = Math.sqrt(dist2);

          // Repulsive force along the unit vector
          const f = kRep / dist2;
          const ux = dx / dist;
          const uy = dy / dist;

          fx.set(a.id, fx.get(a.id) + ux * f);
          fy.set(a.id, fy.get(a.id) + uy * f);
          fx.set(b.id, fx.get(b.id) - ux * f);
          fy.set(b.id, fy.get(b.id) - uy * f);
        }
      }

      // Spring attraction along edges
      for (const e of edges) {
        const a = byId.get(e.source);
        const b = byId.get(e.target);
        if (!a || !b) continue;

        let dx = b.x - a.x, dy = b.y - a.y;
        const dist = Math.sqrt(dx * dx + dy * dy) + 0.001;

        const w = e.weight / maxW; // 0..1
        const target = 260 - 170 * w;

        const stretch = dist - target;
        const f = kLink * stretch;

        const ux = dx / dist;
        const uy = dy / dist;

        fx.set(a.id, fx.get(a.id) + ux * f);
        fy.set(a.id, fy.get(a.id) + uy * f);
        fx.set(b.id, fx.get(b.id) - ux * f);
        fy.set(b.id, fy.get(b.id) - uy * f);
      }

      // Gentle gravity toward center to prevent edge-pinning
      for (const n of nodes) {
        fx.set(n.id, fx.get(n.id) + (cx - n.x) * kCenter);
        fy.set(n.id, fy.get(n.id) + (cy - n.y) * kCenter);
      }

      // Integrate velocity + position, then clamp
      for (const n of nodes) {
        n.vx = (n.vx + fx.get(n.id) * dt) * damping;
        n.vy = (n.vy + fy.get(n.id) * dt) * damping;

        n.x += n.vx;
        n.y += n.vy;

        n.x = Math.max(n.r, Math.min(width - n.r, n.x));
        n.y = Math.max(n.r, Math.min(height - n.r, n.y));
      }
    }
  }

  relax(500);

  // Build SVG
  const svgNS = "http://www.w3.org/2000/svg";
  const svg = document.createElementNS(svgNS, "svg");
  svg.setAttribute("viewBox", `0 0 ${width} ${height}`);
  svg.setAttribute("width", "100%");
  svg.setAttribute("height", "100vh");
  svg.style.display = "block"; // removes inline-gap quirks
  svg.style.border = "none";
  svg.style.borderRadius = "0";

  // edges
  const edgeLayer = document.createElementNS(svgNS, "g");
  edges.forEach(e => {
    const a = byId.get(e.source);
    const b = byId.get(e.target);
    const line = document.createElementNS(svgNS, "line");
    line.setAttribute("x1", a.x);
    line.setAttribute("y1", a.y);
    line.setAttribute("x2", b.x);
    line.setAttribute("y2", b.y);
    line.setAttribute("stroke", "currentColor");

    const wNorm = e.weight / maxW;
    // lighter baseline + narrower range
    line.setAttribute("opacity", String(0.06 + 0.18 * wNorm));
    // slightly thinner overall
    line.setAttribute("stroke-width", String(0.8 + 4 * wNorm));

    line.dataset.source = e.source;
    line.dataset.target = e.target;
    line.dataset.weight = e.weight;
    edgeLayer.appendChild(line);
  });

  // nodes
  const nodeLayer = document.createElementNS(svgNS, "g");
  const nodeEls = new Map(); // id -> { g, circle, text }

  nodes.forEach(n => {
    const g = document.createElementNS(svgNS, "g");
    g.style.cursor = "pointer";

    const c = document.createElementNS(svgNS, "circle");
    c.setAttribute("cx", n.x);
    c.setAttribute("cy", n.y);
    c.setAttribute("r", n.r);
    c.setAttribute("fill", "currentColor");
    c.setAttribute("opacity", "0.85");

    const t = document.createElementNS(svgNS, "text");
    t.setAttribute("x", n.x);
    t.setAttribute("y", n.y + n.r + 14);
    t.setAttribute("text-anchor", "middle");
    t.setAttribute("font-size", "12");
    t.setAttribute("fill", "currentColor");
    t.setAttribute("opacity", "0.9");
    t.textContent = n.id;

    const title = document.createElementNS(svgNS, "title");
    title.textContent = `${n.id}: ${n.count} post(s)`;
    g.appendChild(title);

    g.appendChild(c);
    g.appendChild(t);

    // Background rect sized to text bbox (must be after text is in DOM)
    const labelBg = document.createElementNS(svgNS, "rect");
    labelBg.setAttribute("rx", "4");
    labelBg.setAttribute("ry", "4");
    labelBg.setAttribute("fill", "white");
    labelBg.setAttribute("opacity", "0.92");
    labelBg.setAttribute("stroke", "currentColor");
    labelBg.setAttribute("stroke-opacity", "0.35");
    labelBg.setAttribute("stroke-width", "1");
    labelBg.style.display = "none"; // default off

    // Insert bg *behind* the text (but after circle)
    g.insertBefore(labelBg, t);

    // Now that bg is in DOM (and text is too), measure text
    const bb = t.getBBox();
    const padX = 6;
    const padY = 3;

    labelBg.setAttribute("x", String(bb.x - padX));
    labelBg.setAttribute("y", String(bb.y - padY));
    labelBg.setAttribute("width", String(bb.width + padX * 2));
    labelBg.setAttribute("height", String(bb.height + padY * 2));

    // Save refs (add labelBg)
    nodeEls.set(n.id, { g, circle: c, text: t, labelBg });

    g.addEventListener("mouseenter", () => {
      // If a node is selected, we only show emphasis for selected cluster,
      // but still allow hover emphasis if you're hovering within that cluster.
      if (active) {
        const nbrs = neighbors.get(active) || new Set();
        if (n.id === active || nbrs.has(n.id)) setLabelEmphasis(n.id, true);
      } else {
        setLabelEmphasis(n.id, true);
      }
      showDetails(n.id);
    });

    g.addEventListener("mouseleave", () => {
      // On hover out, revert: if selection exists keep emphasis only for selected cluster
      if (active) {
        const nbrs = neighbors.get(active) || new Set();
        setLabelEmphasis(n.id, n.id === active || nbrs.has(n.id));
      } else {
        setLabelEmphasis(n.id, false);
      }
    });

    g.addEventListener("click", (ev) => {
      ev.stopPropagation();     // prevent svg background handler
      highlight(n.id);
    });

    nodeLayer.appendChild(g);
  });

  svg.appendChild(edgeLayer);
  svg.appendChild(nodeLayer);
  addLegend(svg, width, height);
  svg.addEventListener("click", () => {
    if (active !== null) clearSelection();
  });
  container.innerHTML = "";
  container.appendChild(svg);

  function showDetails(cat) {
    const related = edges
      .filter(e => e.source === cat || e.target === cat)
      .map(e => {
        const other = e.source === cat ? e.target : e.source;
        return { other, weight: e.weight, otherCount: byId.get(other)?.count ?? 0 };
      })
      .sort((a, b) => b.weight - a.weight)
      .slice(0, 12);

    const items = related.map(r => `<li><code>${r.other}</code> — co-occurs ${r.weight}×</li>`).join("");

    details.innerHTML = `
      <div style="padding: 0.75rem; border: 1px solid rgba(0,0,0,0.1); border-radius: 8px;">
        <div><strong>${cat}</strong> (${byId.get(cat).count} posts)</div>
        <div style="margin-top: 0.5rem;">Top overlaps:</div>
        <ul style="margin: 0.5rem 0 0 1.25rem;">${items || "<li>None (with current thresholds)</li>"}</ul>
        <div style="margin-top: 0.5rem; opacity: 0.8;">
          Tip: click a node to highlight its edges; click again to clear.
        </div>
      </div>
    `;
  }

  let active = null;

  function clearSelection() {
    active = null;

    // reset edges
    [...edgeLayer.children].forEach(el => {
      const w = Number(el.dataset.weight);
      const wNorm = w / maxW;
      el.setAttribute("opacity", String(0.06 + 0.18 * wNorm)); // your lighter baseline
    });

    // reset nodes + labels
    for (const n of nodes) {
      const el = nodeEls.get(n.id);
      if (!el) continue;

      el.circle.setAttribute("opacity", "0.85");

      // IMPORTANT: restore display, not just opacity
      el.text.style.display = "";
      el.text.setAttribute("opacity", "0.9");

      // turn off label highlight (also hides labelBg + removes text stroke)
      setLabelEmphasis(n.id, false);
    }
  }

  function highlight(cat) {
    if (active === cat) {
      clearSelection();
      return;
    }

    active = cat;
    const nbrs = neighbors.get(cat) || new Set();

    // labels: emphasize active + neighbors, remove from others
    for (const n of nodes) {
      const isActive = n.id === cat;
      const isNeighbor = nbrs.has(n.id);
      setLabelEmphasis(n.id, isActive || isNeighbor);
    }

    // edges: keep only incident edges prominent
    [...edgeLayer.children].forEach(el => {
      const s = el.dataset.source;
      const t = el.dataset.target;
      const w = Number(el.dataset.weight);
      const on = (s === cat || t === cat);
      el.setAttribute("opacity", on ? String(0.25 + 0.55 * (w / maxW)) : "0.03");
    });

    // nodes: dim/hide everything not in {cat} ∪ neighbors(cat)
    for (const n of nodes) {
      const el = nodeEls.get(n.id);
      if (!el) continue;

      const isActive = n.id === cat;
      const isNeighbor = nbrs.has(n.id);

      if (isActive || isNeighbor) {
        el.circle.setAttribute("opacity", isActive ? "0.95" : "0.85");
        el.text.style.display = "";
        el.text.setAttribute("opacity", "0.9");
      } else {
        setLabelEmphasis(n.id, false);
        el.text.style.display = "none"; // hide labels entirely
      }
    }

    showDetails(cat);
  }

  function addLegend(svg, width, height) {
    const padding = 16;
    const boxW = 360;
    const boxH = 70;

    const x = width - boxW - padding;
    const y = padding;

    const g = document.createElementNS(svgNS, "g");
    g.setAttribute("transform", `translate(${x}, ${y})`);

    const bg = document.createElementNS(svgNS, "rect");
    bg.setAttribute("x", "0");
    bg.setAttribute("y", "0");
    bg.setAttribute("width", String(boxW));
    bg.setAttribute("height", String(boxH));
    bg.setAttribute("rx", "10");
    bg.setAttribute("fill", "white");
    bg.setAttribute("opacity", "0.85");
    bg.setAttribute("stroke", "rgba(0,0,0,0.15)");

    const text1 = document.createElementNS(svgNS, "text");
    text1.setAttribute("x", "14");
    text1.setAttribute("y", "28");
    text1.setAttribute("font-size", "14");
    text1.setAttribute("fill", "currentColor");
    text1.textContent = "Node size = # posts in category";

    const text2 = document.createElementNS(svgNS, "text");
    text2.setAttribute("x", "14");
    text2.setAttribute("y", "52");
    text2.setAttribute("font-size", "14");
    text2.setAttribute("fill", "currentColor");
    text2.textContent = "Edge thickness = # posts with both";

    g.appendChild(bg);
    g.appendChild(text1);
    g.appendChild(text2);

    // optional: clicking legend shouldn't clear selection
    g.addEventListener("click", (ev) => ev.stopPropagation());

    svg.appendChild(g);
  }

  function setLabelEmphasis(id, on) {
    const el = nodeEls.get(id);
    if (!el) return;

    if (on) {
      el.labelBg.style.display = "";
      // outline around text itself
      el.text.setAttribute("paint-order", "stroke");
      el.text.setAttribute("stroke", "white");
      el.text.setAttribute("stroke-width", "3");
      el.text.setAttribute("stroke-linejoin", "round");
    } else {
      el.labelBg.style.display = "none";
      el.text.removeAttribute("paint-order");
      el.text.removeAttribute("stroke");
      el.text.removeAttribute("stroke-width");
      el.text.removeAttribute("stroke-linejoin");
    }
  }
})();
