"=============================================================================
" File: comfortable_motion.vim
" Author: Yuta Taniguchi
" Created: 2016-10-02
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_comfortable_motion')
    finish
endif
let g:loaded_comfortable_motion = 1

let s:save_cpo = &cpo
set cpo&vim


" Default parameter values
if !exists('g:comfortable_motion_interval')
  let g:comfortable_motion_interval = 1000.0 / 60
endif
if !exists('g:comfortable_motion_friction')
  let g:comfortable_motion_friction = 80.0
endif
if !exists('g:comfortable_motion_air_drag')
  let g:comfortable_motion_air_drag = 2.0
endif
if !exists('g:comfortable_motion_scroll_down_key')
  let g:comfortable_motion_scroll_down_key = "\<C-e>"
endif
if !exists('g:comfortable_motion_scroll_up_key')
  let g:comfortable_motion_scroll_up_key = "\<C-y>"
endif

" The state
let s:comfortable_motion_state = {
\ 'impulse': 0.0,
\ 'velocity': 0.0,
\ 'delta': 0.0,
\ }


function! s:tick(timer_id)
  let l:dt = g:comfortable_motion_interval / 1000.0  " Unit conversion: ms -> s
  let l:st = s:comfortable_motion_state  " This is just an alias for the global variable

  " Compute resistance forces
  let l:vel_sign = l:st.velocity == 0
    \            ? 0
    \            : l:st.velocity / abs(l:st.velocity)
  let l:friction = -l:vel_sign * g:comfortable_motion_friction * 1  " The mass is 1
  let l:air_drag = -l:st.velocity * g:comfortable_motion_air_drag
  let l:additional_force = l:friction + l:air_drag

  " Update the state
  let l:st.delta += l:st.velocity * l:dt
  let l:st.velocity += l:st.impulse + (abs(l:additional_force * l:dt) > abs(l:st.velocity) ? -l:st.velocity : l:additional_force * l:dt)
  let l:st.impulse = 0

  " Scroll
  let l:int_delta = float2nr(l:st.delta >= 0 ? floor(l:st.delta) : ceil(l:st.delta))
  let l:st.delta -= l:int_delta
  if l:int_delta > 0
    execute "normal! " . string(abs(l:int_delta)) . g:comfortable_motion_scroll_down_key
  elseif l:int_delta < 0
    execute "normal! " . string(abs(l:int_delta)) . g:comfortable_motion_scroll_up_key
  else
    " Do nothing
  endif
  redraw

  " Stop the thread or continue it
  if abs(l:st.velocity) < 1
    let l:st.velocity = 0
    let l:st.delta = 0
  else
    let l:interval = float2nr(round(g:comfortable_motion_interval))
    call timer_start(l:interval, function("s:tick"), {'repeat': 0})
  endif
endfunction


function! comfortable_motion#flick(impulse)
  let s:comfortable_motion_state.impulse += a:impulse

  " Start a thread
  call timer_start(0, function("s:tick"), {'repeat': 0})
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
