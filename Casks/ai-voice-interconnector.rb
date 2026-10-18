cask "ai-voice-interconnector" do
  version "0.33.0"
  sha256 "79f3603ed3f35d58fd70bc176e4b73d04d1a56fd30ef2dc06e4b35be1139fb65"

  url "https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector/releases/download/v#{version}/ai-voice-interconnector-#{version}-arm64-macos.tar.gz"
  name "AI Voice InterConnector"
  desc "Motor de síntesis de voz (TTS) offline con clonación de voz en español latinoamericano"
  homepage "https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

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
    Los modelos de voz (traduccion, sintesis, clonado de voz y transcripcion; unos 5,85 GB)
    no vienen incluidos:
    descargalos una sola vez con:
      ai-voice-interconnector setup

    Licencia: MPL-2.0. El aviso de disponibilidad del codigo fuente (MPL-2.0
    seccion 3.2) y las atribuciones de terceros viajan dentro del archivo
    instalado:
      #{staged_path}/SOURCE-OFFER.md
      #{staged_path}/THIRD-PARTY-LICENSES.md
  EOS
end
