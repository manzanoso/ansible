# Define o caminho do programa que você deseja executar
$programPath = "C:\Newcon_Deploy\executa_troca_versao.bat"

# Inicie o programa com os parâmetros
Start-Process -FilePath $programPath -WindowStyle Hidden -Wait

# Define o caminho para o arquivo
$filePath = "C:\Newcon_Deploy\Logs\Newcon_Versao.log"

# Define a palavra específica que você está procurando
$palavraAlvo = "Trace"

# Lê o conteúdo do arquivo em um array de linhas
$linhas = Get-Content $filePath

# Inicializa variáveis para armazenar o número da última linha e a frase na última linha
$ultimaLinha = $null
$fraseNaUltimaLinha = $null

# Percorre as linhas do arquivo para encontrar a última ocorrência da palavra
for ($i = 0; $i -lt $linhas.Count; $i++) {
    if ($linhas[$i] -match $palavraAlvo) {
        $ultimaLinha = $i + 1
    }
}

# Verifica se a palavra foi encontrada
if ($ultimaLinha -ne $null) {
    # Obtém a última linha do arquivo
    $linha = $linhas[$ultimaLinha - 1]
    
    # Procura a frase na última linha
    $fraseAlvo = "Processo finalizado com sucesso"
    if ($linha -match $fraseAlvo) {
        $fraseNaUltimaLinha = $matches[0]
    }
}

# Exibe o resultado
if ($ultimaLinha -ne $null) {
    if ($fraseNaUltimaLinha -ne $null) {
        Write-Host $fraseNaUltimaLinha
    } else {
        Write-Host "Processo finalizado sem sucesso"
    }
} 
