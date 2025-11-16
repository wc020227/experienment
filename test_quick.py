# 创建一个简单的测试脚本 test_quick.py
import wave
import numpy as np

# 创建一个1秒的静音WAV文件用于测试
sample_rate = 16000
duration = 1.0
frames = int(sample_rate * duration)
audio_data = np.zeros(frames, dtype=np.int16)

with wave.open('test_silence.wav', 'w') as wav_file:
    wav_file.setnchannels(1)
    wav_file.setsampwidth(2)
    wav_file.setframerate(sample_rate)
    wav_file.writeframes(audio_data.tobytes())

print("创建了测试音频文件: test_silence.wav")