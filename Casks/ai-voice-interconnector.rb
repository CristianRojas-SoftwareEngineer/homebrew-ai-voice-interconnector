cask "ai-voice-interconnector" do
  version "0.27.1"
  sha256 "03ee0660e0505b9bf642b061026be6aa6ebd36002acb8d4dc063ead1c7063bb4"

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
    "~/Library/Caches/ai-voice-interconnector/models",
    "~/Library/Application Support/ai-voice-interconnector",
    "~/.cache/huggingface/hub/models--Qwen--Qwen3-TTS-12Hz-0.6B-CustomVoice",
    "~/.cache/huggingface/hub/models--CristianRojaas--opus-mt-es-en-ct2-int8",
    "~/.cache/huggingface/hub/models--CristianRojaas--opus-mt-en-es-ct2-int8",
    "~/.cache/huggingface/hub/models--istupakov--parakeet-tdt-0.6b-v3-onnx",
    "~/.cache/huggingface/hub/models--Qwen--Qwen3-TTS-12Hz-0.6B-Base",
  ]

  caveats <<~EOS
    Los modelos de voz (traduccion, sintesis y transcripcion; unos 3.3 GB, o 5.85 GB con
    clonado de voz) no vienen incluidos:
    descargalos una sola vez con:
      ai-voice-interconnector setup

    Licencia: GPL-3.0-or-later. La oferta de codigo fuente (GPLv3 seccion 6)
    y las atribuciones de terceros viajan dentro del archivo instalado:
      #{staged_path}/SOURCE-OFFER.md
      #{staged_path}/THIRD-PARTY-LICENSES.md
  EOS
end
