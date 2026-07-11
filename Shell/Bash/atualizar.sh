#!/usr/bin/env bash

# Função para checar se um comando existe antes de rodar
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "=== 1. Atualizando listas e pacotes ==="
sudo apt update
sudo apt upgrade -y

# O full-upgrade é bom, mas requer atenção. 
# No Ubuntu/Debian ele é útil para mudar de versão de Kernel.
read -p "Deseja realizar o FULL-UPGRADE (pode remover pacotes)? [s/N]: " confirm_full
if [[ "$confirm_full" =~ ^[Ss]$ ]]; then
    sudo apt full-upgrade -y
fi

echo -e "\n=== 2. Corrigindo possíveis erros ==="
sudo apt install -f -y
sudo dpkg --configure -a

echo -e "\n=== 3. Limpeza de pacotes desnecessários (Seguro) ==="
# O autoremove é mais inteligente que o deborphan para uso geral
sudo apt autoremove --purge -y

echo -e "\n=== 4. Limpeza de Cache de download ==="
# Autoclean apaga apenas o que não pode mais ser baixado (velharia)
sudo apt autoclean
# Clean apaga TUDO (libera espaço, mas exige download se reinstalar algo)
read -p "Deseja limpar TODO o cache de downloads (libera mais espaço)? [s/N]: " confirm_clean
if [[ "$confirm_clean" =~ ^[Ss]$ ]]; then
    sudo apt clean
fi

echo -e "\n=== 5. Removendo resíduos de kernels/pacotes antigos (rc) ==="
# Remove arquivos de configuração de pacotes que já foram removidos
rc_pkgs=$(dpkg -l | awk '/^rc/ {print $2}')
if [ -n "$rc_pkgs" ]; then
    echo "Limpando configurações residuais..."
    sudo apt purge $rc_pkgs -y
else
    echo "Nenhuma configuração residual encontrada."
fi

echo -e "\n=== 6. Verificações de Sistema ==="
if [ -f /var/run/reboot-required ]; then
    echo "⚠️  REINICIALIZAÇÃO NECESSÁRIA!"
else
    echo "✅ Sistema atualizado, sem necessidade de reiniciar."
fi

# Verifica serviços falhados apenas se o sistema usar Systemd (Ubuntu/Debian)
if command_exists systemctl; then
    echo -e "\n=== Serviços falhados (Systemd) ==="
    systemctl --failed
fi

echo -e "\n=== Espaço em Disco Atual ==="
df -h / | grep -v "Filesystem"

echo -e "\n=== Concluído! ==="
