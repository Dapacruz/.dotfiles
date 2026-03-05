# .dotfiles

### Bootstrap macOS
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Dapacruz/.dotfiles/master/macos/bootstrap.sh)"
```

### Bootstrap Linux
```bash
/bin/bash -c "$(wget -O- https://raw.githubusercontent.com/Dapacruz/.dotfiles/master/linux/bootstrap.sh)"
```

### Bootstrap DevPod
```bash
devpod up . --dotfiles https://github.com/Dapacruz/.dotfiles.git --ide none
```
