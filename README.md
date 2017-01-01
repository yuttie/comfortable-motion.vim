# comfortable-motion.vim

Brings physics-based smooth scrolling to the Vim/Neovim world!

This is highly motivated by the lack of a plugin similar to my favorite Emacs package [emacs-inertial-scroll](https://github.com/kiwanami/emacs-inertial-scroll).

Scroll with `C-d`/`C-u`:
![Scroll with `C-d`/`C-u`](https://cloud.githubusercontent.com/assets/158553/21579969/841ab468-d013-11e6-8ce6-aa5442d52b6b.gif)

Scroll with `C-f`/`C-b`:
![Scroll with `C-f`/`C-b`](https://cloud.githubusercontent.com/assets/158553/21579968/841929ea-d013-11e6-82fb-e0f3d3e8e896.gif)


## Requirements
This plugin depends on the timer API, which requires Vim/Neovim to be at least the following version:

- Vim 7.4.1578 or above
- Neovim 0.1.5 or above

However, currently, this plugin is only tested on Vim 8.0 and Neovim 0.1.7, i.e. my current development environment.


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


### Friction & Air Resistance

```vim
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0
```


### Friction Only

```vim
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 0.0
```


### Air Resistance Only

```vim
let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0
```


## License
The MIT License

Copyright (c) 2016 Yuta Taniguchi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
