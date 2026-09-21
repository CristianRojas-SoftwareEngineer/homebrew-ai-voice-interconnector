cask "ai-voice-interconnector" do
  version "0.20.0"
  sha256 "a10a222d658d50a2b4a217b503aa0d7b485dbf3164ee39db855f704a83f28e1e"

  url "https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector/releases/download/v#{version}/ai-voice-interconnector-#{version}-arm64-macos.tar.gz"
  name "AI Voice InterConnector"
  desc "Motor de síntesis de voz (TTS) offline con clonación de voz en español latinoamericano"
  homepage "https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  binary "ai-voice-interconnector"

  zap trash: [
    "~/Library/Application Support/ai-voice-interconnector",
    "~/.cache/huggingface/hub/models--Qwen--Qwen3-TTS-12Hz-0.6B-CustomVoice",
    "~/.cache/huggingface/hub/models--Qwen--Qwen3-TTS-12Hz-0.6B-Base",
    "~/.cache/huggingface/hub/models--istupakov--parakeet-tdt-0.6b-v3-onnx",
    "~/.cache/huggingface/hub/models--Helsinki-NLP--opus-mt-es-en",
    "~/.cache/huggingface/hub/models--Helsinki-NLP--opus-mt-en-es",
    "~/.cache/huggingface/xet",
  ]

  caveats <<~EOS
    Los modelos de voz (es-mx-latam + en, ~6 GB en total) no vienen incluidos:
    descargalos una sola vez con:
      ai-voice-interconnector setup

    Licencia: GPL-3.0-or-later. La oferta de codigo fuente (GPLv3 seccion 6)
    y las atribuciones de terceros viajan dentro del archivo instalado:
      #{staged_path}/SOURCE-OFFER.md
      #{staged_path}/THIRD-PARTY-LICENSES.md
  EOS
end
