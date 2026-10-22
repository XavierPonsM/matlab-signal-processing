# MATLAB Audio Signal Processing

Two audio-electronics projects from the *Basic Electronics Project* (PBE) course at UPC · ETSETB (2021).

## 1. Class-D amplifier simulation — [`class-d-amplifier/`](class-d-amplifier)

End-to-end time- and frequency-domain simulation of a Class-D (switching) audio amplifier:

```
sine input ─► comparator vs. triangle carrier ─► PWM ─► power stage (×2) ─► LC low-pass filter ─► speaker load
```

| Stage | Implementation |
|---|---|
| Carrier | Triangle wave generator, e.g. 250 kHz (`fTriangular.m`) |
| Modulator | Comparator producing a ±1 PWM signal (`fComparador.m`) |
| Power stage | Fixed gain of 2 |
| Output filter | 2nd-order LC filter (L = 22 µH, C = 470 nF) into a 4–16 Ω load, discretised with the **bilinear transform** and applied with `filter()` (`l_p_f.m`) |
| Analysis | Normalised FFT of every stage (`signals_fft.m`), time- and frequency-domain plots, filter response vs. load resistance (`low_pass_filter.m`) |

The simulation runs at 44 MHz so the switching carrier is well resolved. `classD_2.m` / `.fig` is a GUIDE interface for changing signal and filter parameters interactively.

```matlab
cd class-d-amplifier
mainF          % full chain: time-domain and frequency-domain figures
classD_2       % interactive GUI
```

## 2. Virtual audio instrument — [`audio-measurements/`](audio-measurements)

Uses the computer's sound card as a signal generator and analyser to characterise real audio hardware in a loop-back setup (output → device under test → input).

| Script | Measures |
|---|---|
| `demo_freq_response.m` + `frequencyResponse.m` | **Frequency response**: plays octave-spaced sine tones from 10 Hz to Fs/2, records them, compares FFT peaks and plots gain in dB. Warns if the input saturates. |
| `demo_thd.m` + `F_thd.m` | **Total harmonic distortion** of a 3 kHz tone, computed from the harmonic peaks of the recorded spectrum and cross-checked against MATLAB's `thd()` |

Requires MATLAB with the Signal Processing Toolbox and a sound card with line in/out.
