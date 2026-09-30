por ahora ya arme un repo con los dotfiles de mac
tienen la estructura requerida para que funcionen con stow

ademas, borre del repo de dotfiles las carpetas de mac y de debian

todo:
- [ ] armar un .md para ver como funciona stow
    - [ ] que tenga el tree de dotfiles
    - [ ] que comando hay que correr para que funcione bien (incluir -t y -adopt)
    - [ ] que comando hay q hacer para revertir
- [ ] organizar el repo de dotfiles
    - [ ] pasar de dotfiles/arch/apps a dotfiles/apps
    - [ ] adoptar la estructura necesaria para stow
- [ ] actualizar readmes de ambos repos
    - [ ] agregar como funciona lo de stow
- [ ] agregar un theme switcher con stow
    - [ ] capaz en ves de tener hyprland solo se puede tener tipo:

|- hyprland/default
  |_ .config/hyprland/...
|- hyprland/retro
  |_ .config/hyprland/...
|- hyprland/testing
  |_ .config/hyprland/...

y al llamar stow, en vez de hacer stow hyprland, hacemos stow hyprland/retro, no se si funciona

Para lo del theme switcher:
Claude había dado una opción para correr Claude desde el directorio de dotfiles para elegir un theme.
El tema ahora es: si quiero hacer un script de bash o de rofi lo que sea, yo necesito correr ese comando de stow dentro del directorio de dotfiles 
Buscar como correr un comando dentro de un directorio en particular y obtenerlo en el actual
Para los dotfiles de muji y el de notebook, que el fondo sea un color simple con puntos o línea a modo de cuaderno 
DARK LIGHT MODE - ver qué archivo toca ngw look cuando cambiamos de prefer dark a prefer light, ver si se aplican los cambios a kitty
Además de hacer lo de stow, tener un script que sea tipo install.sh que instale con yay las aplicaciones necesarias y las dependencias, y luego borrar lo q haya en .config y reemplazarlo por lo de stow (fijarse hyprland, creo q no te deja borrar algo en el medio)
https://github.com/lahbibsemlali/arch-hyprland-dotfiles
try scrolling layout
Se puede usar el agent de vscode para hacer lo de los dotfiles
https://tmpout.sh/5/
Arreglar readme dotfiles, agregar imágenes 

- [GitHub - if-not-nil/dots · GitHub](https://github.com/if-not-nil/dots)
- [GitHub - if-not-nil/bark: a warmer colorscheme · GitHub](https://github.com/if-not-nil/bark)
- [How to Install and Customize MangoWC (2026 Edition) | Wayland Compositor - YouTube](https://www.youtube.com/watch?v=Q1Jgw_q0gWE)
- [you can just use the same dev setup forever - YouTube](https://www.youtube.com/watch?v=tBxtnvatFYI)
- [My Forever Dev Workflow - YouTube](https://www.youtube.com/watch?v=_YaI2vDbk0o)
- [How to Customize Tmux (20XX Edition) | Zero Plugins - YouTube](https://www.youtube.com/watch?v=XivdyrFCV4M)
- [heather mason, men, Silent Hill, low light, neon, red, lights, Silent Hill 3, video games, digital art, simple background, video game art, blinds | 3840x2160 Wallpaper - wallhaven.cc](https://wallhaven.cc/w/qroy2d)
- [An\\_Yb, men, women, falling, digital art, artwork, illustration, digital painting, outdoors, daylight, sky, clouds, floating, building, 4K, school uniform, architecture, black socks , Sonny Boy | 3840x2160 Wallpaper - wallhaven.cc](https://wallhaven.cc/w/gwdyl7)
