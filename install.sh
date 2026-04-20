#!/bin/bash

usage(){
echo ""
echo "  Usage:  $0 [ -h | --help ]"
echo ""
echo "          Instala o monitoramento de temperatura"
echo "          do Water Cooler Rise Mode Aura Ice no Arch Linux."
echo ""
}

# Help

while [[ $# -gt 0 ]]; do
case $1 in
-h|--help)
usage
exit 0
;;
esac
done

# Root check

if [[ $EUID -ne 0 ]]; then
echo ""
echo "  ERRO: Execute como root (use sudo)"
echo ""
exit 1
fi

echo ""
echo "  INFO: Instalando Rise Mode Aura Ice (Arch Linux)..."

# ==============================
# NOVO PASSO: garantir lm_sensors
# ==============================

echo "  INFO: Verificando/instalando lm_sensors..."

if ! pacman -Qi lm_sensors &> /dev/null; then
    echo "  INFO: lm_sensors não encontrado. Instalando..."
    pacman -Sy --noconfirm lm_sensors || {
        echo "  ERRO: Falha ao instalar lm_sensors"
        exit 1
    }
else
    echo "  INFO: lm_sensors já está instalado"
fi

# Teste básico do sensors

echo "  INFO: Verificando sensores..."
if ! sensors > /dev/null 2>&1; then
    echo "  AVISO: sensors pode não estar configurado corretamente"
    echo "  Rode manualmente: sensors-detect"
fi

# Permissões

echo "  INFO: Ajustando permissões..."
chmod +x risemode.sh

# Copiando script

echo "  INFO: Instalando binário..."
cp -f risemode.sh /usr/bin/risemode || {
echo "  ERRO: Falha ao copiar risemode"
exit 1
}

# Instalando serviço

echo "  INFO: Instalando serviço systemd..."
cp -f risemode.service /usr/lib/systemd/system/ || {
echo "  ERRO: Falha ao copiar serviço"
exit 1
}

# Reload systemd

echo "  INFO: Recarregando systemd..."
systemctl daemon-reexec
systemctl daemon-reload

# Enable + start

echo "  INFO: Habilitando serviço..."
systemctl enable risemode.service || {
echo "  ERRO: Falha ao habilitar serviço"
exit 1
}

echo "  INFO: Iniciando serviço..."
systemctl start risemode.service || {
echo "  ERRO: Falha ao iniciar serviço"
exit 1
}

echo ""
echo "  SUCESSO: Instalado com sucesso no Arch Linux!"
echo ""