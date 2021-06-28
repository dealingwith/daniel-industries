---
layout: post
title: "A Tiny Roam Tweak"
excerpt: 
date: 2021-04-13 19:42:26 -0500
categories: 
---

<img src="/assets/2021/04/logseq.png" style="float:right; display:inline; width: 50%; margin-left: 7px;">We use [Roam](https://roamresearch.com/) extensively at work, but as I am prone to do, I was [messing with Roam's styles](https://gist.github.com/dealingwith/2619cd51dcd01e062701ae41c73fa5d7) to try to make them more pleasing to my eye. One thing I couldn't style were completed todos. I use the similar OSS tool [Logseq](https://github.com/logseq/logseq) for my personal notes/journalling/capture and I find their handling of todo display much nicer.

Maybe there's a way to get to the text from the checked input in this Roam HTML, but I couldn't figure it out:

```html
<span>
  <span>
    <label class="check-container">
      <input type="checkbox" checked>
      <span class="checkmark"></span>
    </label>
  </span>
  Sanity Gardening
</span>
```

Instead, I hacked together some javascript that updates checked todos after a new Roam page loads:

```javascript
let checkmate = () => {
  var markedCheckbox = document.querySelectorAll('input[type="checkbox"]:checked');
  for (var checkbox of markedCheckbox) {
    checkbox.parentNode.parentNode.parentNode.style.textDecoration = "line-through";
    checkbox.parentNode.parentNode.parentNode.style.color = "lightgray";
  }
}
checkmate();
window.addEventListener('popstate', (event) => {
  window.setTimeout(checkmate, 1000)
});
```

I could probably listen for something else besides 'popstate' and avoid the one second wait, but the content isn't on the page yet if I don't use the dreaded 'setTimeout'.

To use it, you can drag this link to your bookmarks, and click it after loading Roam:

<a href="javascript:(function()%7Blet%20checkmate%20%3D%20()%20%3D%3E%20%7B%0A%20%20var%20markedCheckbox%20%3D%20document.querySelectorAll('input%5Btype%3D%22checkbox%22%5D%3Achecked')%3B%0A%20%20for%20(var%20checkbox%20of%20markedCheckbox)%20%7B%0A%20%20%20%20checkbox.parentNode.parentNode.parentNode.style.textDecoration%20%3D%20%22line-through%22%3B%0A%20%20%20%20checkbox.parentNode.parentNode.parentNode.style.color%20%3D%20%22lightgray%22%3B%0A%20%20%7D%0A%7D%0Acheckmate()%3B%0Awindow.addEventListener('popstate'%2C%20(event)%20%3D%3E%20%7B%0A%20%20window.setTimeout(checkmate%2C%201000)%0A%7D)%3B%7D)()%3B">Complete Roam Todos</a>

Since Roam never reloads the actual web page, it should work until you reload Roam for whatever reason. I think there is a way to have embedded JavaScript execute in Roam, but I'm pretty sure it would apply to everyone on my team using the same Roam database.

---

Here's another one to toggle the bullets next to checkboxes _in the sidebar only_ (I keep my todo list open over there).

```javascript
document.querySelectorAll("#right-sidebar .rm-query-content div.controls.rm-block__controls").forEach(
  function(bullet){
    if (bullet.style.display == 'none') {
      bullet.style.display = 'flex'
    } else {
      bullet.style.display = 'none'
    }
  }
)
```

<a href="javascript:(function()%7Bdocument.querySelectorAll(%22%23right-sidebar%20.rm-query-content%20div.controls.rm-block__controls%22).forEach(%0A%20%20function(bullet)%7B%0A%20%20%20%20if%20(bullet.style.display%20%3D%3D%20'none')%20%7B%0A%20%20%20%20%20%20bullet.style.display%20%3D%20'flex'%0A%20%20%20%20%7D%20else%20%7B%0A%20%20%20%20%20%20bullet.style.display%20%3D%20'none'%0A%20%20%20%20%7D%0A%20%20%7D%0A)%7D)()">Toggle Todo Bullets</a>

The problem with that one is new todos will have bullets regardless, so the toggle becoming problemati (some will toggle on, some off). Here's one to remove bullets and keep them removed:

```javascript
let unbullet = () => {
  document.querySelectorAll("#right-sidebar .rm-query-content div.controls.rm-block__controls").forEach(
    function(bullet) {
      bullet.style.display = 'none'
    }
  )
}
unbullet();
window.addEventListener('popstate', (event) => {
  window.setTimeout(unbullet, 1000)
});
```

<a href="javascript:(function()%7Blet%20unbullet%20%3D%20()%20%3D%3E%20%7B%0A%20%20document.querySelectorAll(%22%23right-sidebar%20.rm-query-content%20div.controls.rm-block__controls%22).forEach(%0A%20%20%20%20function(bullet)%20%7B%0A%20%20%20%20%20%20bullet.style.display%20%3D%20'none'%0A%20%20%20%20%7D%0A%20%20)%0A%7D%0Aunbullet()%3B%0Awindow.addEventListener('popstate'%2C%20(event)%20%3D%3E%20%7B%0A%20%20window.setTimeout(unbullet%2C%201000)%0A%7D)%3B%7D)()%3B">Remove Todo Bullets</a>
