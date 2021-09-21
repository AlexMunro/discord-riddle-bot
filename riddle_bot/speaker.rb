# frozen_string_literal: true

require "google/cloud/text_to_speech"

module RiddleBot
  # Giveth speech unto the riddles
  class Speaker
    SPEECH_FILE = "/tmp/speech.mp3"

    def read_me(riddle, voice)
      download_speech_file(riddle.question)
      send_to_voice_channel(voice)

      sleep(5)

      download_speech_file(riddle.answer)
      send_to_voice_channel(voice)
    end

    private

    def client
      @client ||= Google::Cloud::TextToSpeech.text_to_speech do |config|
        config.credentials = ENV["GCP_TTS_KEYFILE"]
      end
    end

    def download_speech_file(text)
      audio = client.synthesize_speech(
        input: { text: text },
        voice: {
          language_code: "en-AU",
          ssml_gender: "MALE",
          name: "en-AU-Wavenet-D",
        },
        audio_config: { audio_encoding: "MP3" },
      ).audio_content

      File.open(SPEECH_FILE, "w") { |file| file.write(audio) }
    end

    def send_to_voice_channel(voice)
      voice.play_file(SPEECH_FILE)
    end
  end
end
