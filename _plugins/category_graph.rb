# frozen_string_literal: true

require "json"
require "time"

module Jekyll
  # A virtual page that emits JSON at /assets/data/category_graph.json
  class CategoryGraphJsonPage < Page
    def initialize(site, payload)
      @site = site
      @base = site.source
      @dir  = "assets/data"
      @name = "category_graph.json"

      process(@name)

      # Ensure JSON is not wrapped in any layout
      self.data = {}
      self.data["layout"] = nil

      # Force the final output URL (and on-disk path under _site)
      self.data["permalink"] = "/assets/data/category_graph.json"

      self.content = JSON.pretty_generate(payload)
    end
  end

  class CategoryGraphGenerator < Generator
    safe true
    priority :low

    def generate(site)
      payload = build_category_graph_payload(site)
      site.pages << CategoryGraphJsonPage.new(site, payload)
    end

    private

    def build_category_graph_payload(site)
      posts = site.posts.docs

      # Collect categories per post; support both `categories:` and `category:`
      post_cats = posts.map do |p|
        cats = []
        cats.concat(Array(p.data["categories"]))
        cats << p.data["category"] if p.data.key?("category")
        cats.map { |c| normalize_category(c) }
            .reject(&:empty?)
            .uniq
            .sort
      end

      freq = Hash.new(0)
      co   = Hash.new { |h, k| h[k] = Hash.new(0) }

      post_cats.each do |cats|
        next if cats.empty?

        cats.each { |c| freq[c] += 1 }

        # Undirected co-occurrence counts
        cats.combination(2).each do |a, b|
          co[a][b] += 1
          co[b][a] += 1
        end
      end

      nodes = freq.map { |cat, count| { id: cat, count: count } }
                  .sort_by { |n| -n[:count] }

      edges = []
      co.each do |a, inner|
        inner.each do |b, w|
          next if a >= b # dedupe undirected edges
          edges << { source: a, target: b, weight: w }
        end
      end

      {
        generated_at: Time.now.utc.iso8601,
        post_count: posts.length,
        node_count: nodes.length,
        edge_count: edges.length,
        nodes: nodes,
        edges: edges
      }
    end

    def normalize_category(cat)
      cat.to_s.strip.downcase
    end
  end
end
