@echo off
powershell -NoProfile -Command "$text=[Console]::In.ReadToEnd(); [Console]::Out.Write($text.ToUpperInvariant())"
