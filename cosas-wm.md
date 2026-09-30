reestructurar los dotfiles como antes, no hace falta stow, escribir el cacho de bash que copia los archivos 

elegir un solo theme y quedarse con ese, capaz dos uno light y uno dark

ver si puedo tener un solo archivo principal y puedo hacer los require necesarios para que me quede el archivo prolojo como lo tenia en hyprland

Como poner de vuelta el login de gnome en arch, ahora no me acuerdo que saque y ahora no aparece

tener un menu de rofi que apunte a una carpeta con scripts, y que cada uno haga cosas distintas (toggle waybar, toggle gaps, toggle borders, wallpaper switcher, uno que te deje elegir entre las opciones de wlogout pero a modo de fzf)

hacer un repo aparte solo para wallpapers? y tener en el de sway solo el de jvscholz?

poner a | como separador en vez de \[ y \]

# settings
- blur/rounding/animations disabled
- bibata cursor
- autostart ssh, swaync, waybar, swaybg, systemctl, wlpaste (see hyprland.lua)
- caps lock to escape
- layout latam
- border 3px
- gaps 4px
- no borders if there is only one window 

# binds (mod + ...)
- numbers - switch workspace
    * shift - move window to that workspace
    * shift = alt - move silent

- enter - terminal
- space - app launcher

- q - close window
- w - toggle waybar
- r - launch rmpc (capaz cambiar a m (de musica) y dejar r para resize)
- t - (maybe change to e and leave t to toggle floating) - toggle between tiling and tabbed mode

- a - switch to last workspace
- s - launch localsend (floating and centered)
- f - fullscreen
    * shift f - toggle floating

- hjkl - move focus
    * shift - move window around

- c - center window
- v - launch clipboard
- b - launch bluetui (floating and centered)

necesito alguna para cambiar la orientacion del split, mas alla de , y . para la orientacion manual
faltarian para browser, capaz mod+delete.
otro para que cambie la ventana a floating, la ponga arriba a la derecha pequeña y la haga sticky

ver la diferencia entre fullscreen (f11), full width (que ocupe todo el espacio tiling), y fullscreen within window (la ventana piensa que esta en fullscreen, pero su tamaño no cambia)

unassigned: e, z, x, n, m, g, d, y, u, i, o

- scrollwheel - change to previous/next workspace

## other binds
- Alt + space - window picker
- printScreen - screenshot
    * shift - full screen screenshot
- misc keyboard media kids
    * volume up, down, mute
    * next, previous, play/pause
    * las otras todavia no se a que asignar

# apps and utilities
- helium or zen browser
- kitty terminal
- mpv
- rmpc/mpd
- rofi - (buscar wofi como replacement para wayland)
- waybar-git
- sioyek / zathura
- qimgv

## command line / terminal 

### cli
- ripgrep
- yay
- dezoomify
- [gallery-dl](https://codeberg.org/mikf/gallery-dl)
- ncdu
- git/github
- cmatrix, csakura, cava, cpond, cbonsai
- bat
- fzf

### tui
- bluetui
- tmux
- yazi
- nvim-git

# inspo
[stormy seas (de este me gusto la font, capaz para la barra)](https://www.reddit.com/r/unixporn/comments/1we9e8b/berry_stormy_seas/)
[gemeinwesen mandated larp (me gusto la barra abajo de las fotos)](https://www.reddit.com/r/unixporn/comments/1wd0fvk/dwm_gemeinwesen_mandated_larp/)
[minimalism and nature](https://www.reddit.com/r/unixporn/comments/1wg7zcj/dwm_minimalism_and_nature/)
[first rice (la barra deberia ser asi, similar a la de dwm/i3)](https://www.reddit.com/r/unixporn/comments/18zh207/sway_first_rice/)
[omarchy plugins (para inspiracion)](https://plugins.omarchy.org)

# others
- helium / qutebrowser
- cambiar usario de tom a t
- cambiar password de 1405 a 0 asi hago mas rapido
- superfile? o me quedo con yazi
- cambiar bash por zsh
- igualar la comfig de mac (mas q nada por fzf lua y zsh)
- lung notification on youtube and also if-not-nil/dots on github (ver config tmux y nvim, fijarse primero el video)
- dreams of code
