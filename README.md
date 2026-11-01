# homebrew-ai-voice-interconnector

Tap de Homebrew de [AI Voice-InterConnector](https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector): herramienta CLI de voz con IA, 100% local en español e inglés y sin requerir GPU. Transcripción, texto a voz con clonación de voz y traducción de voz a voz con tu voz clonada.

El Cask instala el binario para **macOS 26 (Tahoe) o posterior en Apple Silicon**. Se regenera de forma automática con cada versión publicada.

## Instalación

```bash
brew tap CristianRojas-SoftwareEngineer/ai-voice-interconnector
brew install --cask ai-voice-interconnector
ai-voice-interconnector setup
```

Homebrew verifica el checksum, deja el binario en el PATH y quita la cuarentena de Gatekeeper. El Cask no descarga los modelos: lo hace `setup`, una sola vez, y a partir de ahí todo funciona sin conexión.

## Actualizar y desinstalar

```bash
brew upgrade --cask ai-voice-interconnector
brew uninstall --cask --zap ai-voice-interconnector
```

`--zap` borra también los modelos descargados y los datos de la aplicación.

## Documentación

Uso, requisitos y otros canales de instalación (Windows, Linux y macOS sin Homebrew) en el [repositorio principal](https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector).
