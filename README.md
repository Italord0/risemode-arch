# Water Cooler Rise Mode Aura Ice Monitor no Arch Linux

Este projeto permite o monitoramento da temperatura no Water Cooler Rise Mode Aura Ice para sistemas Arch Linux.

## Dependências

Este script instala as seguintes dependências:
- lm-sensors

Modelos suportados:
- `Water Cooler Rise Mode Aura Ice Black 240mm ARGB - RM-WAIB-05-ARGB`
- Provavelmente funcionará nos modelos de 120mm e 360mm.

### Instalção


```bash
git clone https://github.com/Italord0/risemode-arch && cd risemode-arch && sudo chmod +x install.sh && sudo ./install.sh; cd .. && sudo rm -rf risemode-arch
```

## Solução de problemas

1) Se você encontrar algum erro relacionado as temperaturas, certifique-se de que o pacote lm-sensors esteja instalado corretamente.
2) Certifique-se de que o Water Cooler Rise Mode Aura Ice esteja conectado corretamente ao seu sistema.
