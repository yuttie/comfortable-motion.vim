# comfortable-motion.vim

Brings physics-based smooth scrolling to the Vim world!

This is highly motivated by the lack of a plugin similar to my favorite Emacs package [emacs-inertial-scroll](https://github.com/kiwanami/emacs-inertial-scroll).

Scroll with `C-d`/`C-u`:
![Scroll with `C-d`/`C-u`](https://raw.githubusercontent.com/yuttie/comfortable-motion.vim/gh-pages/C-D_C-U.gif)

Scroll with `C-f`/`C-b`:
![Scroll with `C-f`/`C-b`](https://raw.githubusercontent.com/yuttie/comfortable-motion.vim/gh-pages/C-F_C-B.gif)

## Installation

For example, with [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'yuttie/comfortable-motion.vim'
```


## Configuration

By default, the following key mappings are defined.

```vim
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

nnoremap <silent> <C-f> :call comfortable_motion#flick(400)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-400)<CR>
```

To prevent the plugin from defining those default key mappings,
you can set `g:comfortable_motion_no_default_key_mappings` to 1.

```vim
let g:comfortable_motion_no_default_key_mappings = 1
```

There are three configurable parameters:

* `g:comfortable_motion_interval` [default: 1000.0 / 60]
* `g:comfortable_motion_friction` [default: 80.0]
* `g:comfortable_motion_air_drag` [default: 2.0]

For example, with any of the following configurations, you can get `<C-u>`/`<C-d>` (with the
default impulse value of `-100`/`100`) to scroll a window about 25 lines, but
tastes are different.


### Fricion & Air Resistance

```vim
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
```


### Fricion Only

```vim
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0
```


### Air Resistance Only

```vim
let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0
```
