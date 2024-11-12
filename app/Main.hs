-- Main.hs
module Main where

import CaesarCipher (encryptText, decryptText)
import WordFrequency (wordFrequency)

main :: IO ()
main = do
    putStrLn "========== Escolha uma Opção =========="
    putStrLn "1 - Encriptar texto Cifra de Cesar"
    putStrLn "2 - Desencriptar texto Cifra de Cesar"
    putStrLn "3 - Frequencia de palavras no texto"
    putStrLn "4 - Sair"
    option <- getLine
    case option of
        "1" -> encriptar
        "2" -> desencriptar
        "3" -> analisarFrequencia
        "4" -> putStrLn "Saindo..."
        _   -> putStrLn "Opção inválida!" >> main

encriptar :: IO ()
encriptar = do
    putStrLn "Digite o texto para encriptar:"
    text <- getLine
    putStrLn "Digite o deslocamento (exemplo: 3):"
    shift <- readLn
    putStrLn $ "Texto encriptado: " ++ encryptText shift text
    main

desencriptar :: IO ()
desencriptar = do
    putStrLn "Digite o texto para desencriptar:"
    text <- getLine
    putStrLn "Digite o deslocamento (exemplo: 3):"
    shift <- readLn
    putStrLn $ "Texto original: " ++ decryptText shift text
    main

analisarFrequencia :: IO ()
analisarFrequencia = do
    putStrLn "Digite o texto para análise de frequência de palavras:"
    text <- getLine
    let freq = wordFrequency text
    putStrLn "\nFrequência das palavras:"
    mapM_ print freq
    main
