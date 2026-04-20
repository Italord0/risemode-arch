# Water Cooler Rise Mode Aura Ice Monitor no Arch Linux

Este projeto permite o monitoramento da temperatura no Water Cooler Rise Mode Aura Ice para sistemas Arch Linux.

## Dependências

Este script instala as seguintes dependências:
- lm-sensors

Você pode instalar executando o script `install.sh`:

Modelos suportados:
- `Water Cooler Rise Mode Aura Ice Black 240mm ARGB - RM-WAIB-05-ARGB`
- Provavelmente funcionará nos modelos de 120mm e 360mm.

### Guia passo a passo

1. **Clone o Repositório**: O script e os arquivos de configuração necessários são hospedados no GitHub. Use o git para clonar o repositório para sua máquina local.

    ```bash
    git clone https://github.com/Italord0/risemode-arch
    ```

2. **Navegue até o Diretório do Projeto**: Mude seu diretório atual para a pasta do projeto recém-clonado.

    ```bash
    cd risemode-arch
    ```

3. **Execute o script de instalação**: O script `install.sh` automatizará o processo de instalação. Execute o script executando:

    ```bash
    ./install.sh
    ```

## Solução de problemas

1) Se você encontrar algum erro relacionado as temperaturas, certifique-se de que o pacote lm-sensors esteja instalado corretamente.
2) Certifique-se de que o Water Cooler Rise Mode Aura Ice esteja conectado corretamente ao seu sistema.
3) Certifique-se que os aruivos install.sh, remove.sh, e risemode.sh tem permissão de execução. 
