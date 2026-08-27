cask "ai-voice-interconnector" do
  version "0.15.0"
  sha256 "b106b7700d0c0bb287b7179738320deb7f583d481ae306aa130501c8357a4296"

  url "https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector/releases/download/v#{version}/ai-voice-interconnector-#{version}-arm64-macos.tar.gz"
  name "AI Voice InterConnector"
  desc "Motor de sintesis de voz (TTS) offline con clonacion de voz en espanol latinoamericano"
  homepage "https://github.com/CristianRojas-SoftwareEngineer/AI-Voice-InterConnector"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  binary "ai-voice-interconnector"

  zap trash: [
    "~/Library/Application Support/ai-voice-interconnector",
    "~/.cache/huggingface/hub/models--ResembleAI--Chatterbox-Multilingual-es-mx-latam",
    "~/.cache/huggingface/hub/models--ResembleAI--chatterbox",
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
