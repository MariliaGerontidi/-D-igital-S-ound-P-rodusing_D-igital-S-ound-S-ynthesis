s.boot

//Sound 1
~sig = Env([-2, 0, 2], [1,1], 'lin').asSignal(1025);
~sig = ~sig.asWavetableNoWrap;
~sig.plot;
~sigb = Buffer.loadCollection(s, ~sig);
(
{
	Shaper.ar(~sigb, (SinOsc.ar(4))) * 0.2!2;
}.plot
)
(
{
	Shaper.ar(~sigb, (SinOsc.ar(6))) * 0.2!2;
}.plot
)

//Sound 2
~sig = Env([-2, 0, 2], [1,1], 'lin').asSignal(1025);
~sig = ~sig.asWavetableNoWrap;
~sig.plot;
~sigb = Buffer.loadCollection(s, ~sig);

(
{
	Shaper.ar(~sigb, (SinOsc.ar(2))) * 0.2!2
}.plot
)

(
{
	Shaper.ar(~sigb, (SinOsc.ar(0, 4))) * 0.2!2
}.plot
)

//Sound 3
(
SynthDef(\sound3, {|freq1 = 500, freq2 = 300 amp1 = 0.4, amp2 = 0.2|
	var sig1, sig2, sum;
	sum = 0;
	12.do{
		sig1 = SinOsc.ar(freq1, 0, amp1)!2;
	};
	7.do{
		sig2 = SinOsc.ar(freq2, 1, amp2)!2;

	};
	sum = sum + sig1 + sig2;
}.plot;
))

//Sound 4
(
SynthDef(\sound4, {|freq1 = 500, amp1 = 0.3, freq2 = 440, amp2 = 0.5|
	var sig1, sig2, sum;
	sig1 = Mix.fill(5,
		SinOsc.ar(freq1, 0, amp1)!2;
	);
	sig2 = Mix.fill(5,
		SinOsc.ar(freq2, 1, amp2)!2;
	);
	sum = sig1 + sig2;
}.plot;
))

//Sound 5
(
SynthDef (\sound5, {|freq1 = 220, freq2 = 2200, amp1 = 0.5, amp2 = 0.6|
	var sig1, sig2, sum;
	sig1 = Array.fill(5, {|i|
		SinOsc.ar(i + freq1, 0, amp1);
	});
		sig2 = Array.fill(5, {|i|
		SinOsc.ar(i + freq2, 1, amp2);
	});
	sig1[2] = 0;
	sig2[1] = 0;
	sig2[4] = 0;
	sum = sig1 + sig2;
}.freqscope;
))

//Sound 6
(
SynthDef(\sound6, {|freq1 = 440, freq2 = 880 amp1 = 0.5, amp2 = 0.5|
	var sig1, sig2, sum, cn;
	sum = 0;
	5.do{
		sig1 = SinOsc.ar(
			LFNoise1.kr({Rand(0.9, 1)}).exprange(40, 4000),
			0,
			amp1 * LFNoise1.kr({Rand(0.6, 4)}).exprange(0.01, 1))!2;
	};
	5.do{
		sig2 = SinOsc.ar(
			LFNoise1.kr({Rand(0.9, 1)}).exprange(40, 4000),
			1,
			amp2 * LFNoise1.kr({Rand(0.6, 4)}).exprange(0.01, 1))!2;
	};
	sum = sum + sig1 + sig2;
	cn = FFT(LocalBuf(2048), sum);
	IFFT(cn)!2
}.scope;
))
// Ο μετασχηματισμος Φουριε ειναι ενας αλγοριθμος που υπολογιζει το σχηματισμο μιας ακολουθιας, μετατρεπει δηλαδη ενα σημα (απο το αρχικο του σημειο) στην αναπαρασταση του στο συχνοτικο πεδιο. Η αμεσοτητα της λειτουργειας αυτου του αλγορυθμου μας επιτρεπει την δημιουργια των απαραιτητων πινακων ωστε να διαμορφωσουμε διαφορετικα συχνοτικα δεδομενα απο μια ακολουθια τιμων.