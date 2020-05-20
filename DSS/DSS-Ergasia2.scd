s.boot

//1st Sound (Modulation Synthesis)
(
SynthDef(\sound1, {|freq = 220, mfreq = 880, amp = 0.5, mamp = 0.05|
	var modulator, carrier, sum, env;
	modulator = SinOsc.ar(mfreq, 0, mamp);
	carrier = SinOsc.ar(freq, 0, amp);
	env = Line.kr(1, 0, 2, doneAction:2);
	sum = ((modulator * carrier) + Saw.ar(freq/4, amp/2) * env);
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση δυο ημιτονοειδων ταλαντωτων(βασικος 220Hz και ''διαμορφωτης'' 880Hz) με ιδιες εντασεις(mul). Δηλωσα arguments(συχνοτητα,ενταση)και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 2 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneAction2). Στο τελος προσθεσα στο τελικο αποτελεσμα εναν πριωνοτο ταλαντωτη(με 4Hz συχνοτητα και ενταση 2)

//2nd Sound (Modulation Synthesis)
(
SynthDef(\sound2, {|freq = 50, mfreq =660, amp = 0.5, mamp = 0.05|
	var modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	env = Line.kr(1, 0, 2, doneAction:2);
	sum = Pulse.ar(freq, modulation, amp) * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμόρφωση πλατους παλμού, με χρηση παλμου(Pulse) και ''διαμορφωτη'' στη φαση (με συχνοτητα 660Hz).Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 2 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2)

//3rd Sound (Modulation Synthesis)
(
SynthDef(\sound3, {|mfreq = 20, amp = 0.5, mamp = 0.05|
	var modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	env = Line.kr(1, 0, 5, doneAction:2);
	sum = (SinOsc.ar((LFNoise0.kr(10).exprange(440, 880)), modulation, amp) * env);
	Out.ar([0,1],sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση ημιτονοειδους ταλαντωτη στον οποιο για συχνοτητα επιλεγονται 10 τυχαιες τιμες σε δωσμενο ευρος(440-880Ηz) με το LFNoise0 και ''διαμορφωτη'' στη φαση(με συχνοτητα 20Hz). Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 4 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2)

//4th Sound (Modulation Synthesis)
(
SynthDef(\sound4, {|freq = 330, mfreq = 60, amp = 0.5, mamp = 0.05|
	var modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	env = Line.kr(1, 0, 1, doneAction:2);
	sum = SinOsc.ar(freq, modulation, amp) * env;
	Out.ar([0,1],sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση ημιτονοειδους ταλαντωτη και ''διαμορφωτη'' στη φαση(με συχνοτητα 60Hz). Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 1 δευτερολεπτo κι επειτα σβηνεται απο το server με το doneaction2)

//5th Sound (Modulation Synthesis)
(
SynthDef(\sound5, {|freq = 440, mfreq = 230, amp = 0.8, mamp = 0.5|
	var modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	modulation = (modulation/2) * 0.5;
	env = Line.kr(0, 1, 3, doneAction:2);
	sum = SinOsc.ar(freq, 0, modulation * amp) * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση δυο ημιτονοειδων ταλαντωτων(βασικος 440Hz(με ενταση 0.8) και ''διαμορφωτης'' 230Hz(με ενταση 0.5)). Δηλωσα arguments(συχνοτητα,ενταση)και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επειδη ειναι mul modulation φροντισα να παιρνει μονο θετικες τιμες.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 0 στο 1 σε 3 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2)

//6th Sound (Modulation Synthesis)
(
SynthDef(\sound6, {|mfreq =80, amp = 0.05, mamp = 0.05|
	var modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	env = Line.kr(1, 0, 2, doneAction:2);
	sum = (LFPulse.ar((LFNoise0.kr(10).exprange(300,600)), modulation, amp) * env);
	Out.ar([0,1], sum)
}).play;
)
//Διαμόρφωση πλατους παλμού, με χρηση παλμου(Pulse)για του οποιου τη συχνοτητα επιλεγονται 10 τυχαιες τιμες σε δοσμενο ευρος(300-600Hz) και ημιτονοειδους ''διαμορφωτη''(με συχνοτητα 80Hz).Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 2 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2)

//7th Sound (Modulation Synthesis)
(
SynthDef(\sound7, {|freq = 200, mfreq =80, amp = 0.5, mamp = 0.05|
	var modulation, carrier, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	carrier = Pulse.ar(freq, modulation, amp);
	env = Line.kr(1, 0, 4, doneAction:2);
	sum = FreeVerb.ar(carrier, 0.3, 0.8, 0.25) * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμόρφωση πλατους παλμού, με χρηση παλμου(Pulse) και ''διαμορφωτη'' στη φαση (με συχνοτητα 80Hz).Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 4 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2).Στο τελος προσθεσα reverb για αλλαγη.

//8th Sound (Modulation Synthesis)
(
SynthDef(\sound8, {|freq = 350, mfreq = 150, amp = 0.5, mamp = 0.5|
	var modulator, carrier, sum, env;
	modulator = SinOsc.ar(mfreq, 0, mamp);
	carrier = SinOsc.ar(freq, 0, amp);
	env = Line.kr(1, 0, 2, doneAction:2);
	sum = (modulator * carrier) * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση δυο ημιτονοειδων ταλαντωτων(βασικος 350Hz και ''διαμορφωτης'' 150Hz) με ιδιες εντασεις(mul). Δηλωσα arguments(συχνοτητα,ενταση)και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 2 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2)

//9th Sound (Modulation Synthesis)
(
SynthDef(\sound9, {|mfreq = 420, amp = 0.7, mamp = 0.8|
	var modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	env = Line.kr(1, 0, 2, doneAction:2);
	sum = SinOsc.ar(modulation, 0, amp) * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση ημιτονοειδους ταλαντωτη και ''διαμορφωτη'' στη συχνοτητα(420Hz). Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 2 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2)

//10th Sound (Modulation Synthesis)
(
SynthDef(\sound10, {|freq = 320, mfreq = 60, mamp = 0.05|
	var s1, s2, s3, s4, modulation, sum, env;
	modulation = SinOsc.ar(mfreq, 0, mamp);
	s1 = SinOsc.ar(freq, modulation, 0.5);
	s2 = SinOsc.ar(freq * 2, modulation, 0.25);
	s3 = SinOsc.ar((freq * 3)/2, modulation, 0.125);
	s4 = SinOsc.ar((freq * 4)/3, modulation, 0.0625);
	env = Line.kr(1, 0, 2, doneAction:2);
	sum = (s1 + s2 + s3 + s4) * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη Συνθεση με χρηση ημιτονοειδους ταλαντωτη(320Hz) και ''διαμορφωτη'' στη φαση(με συχνοτητα 60Hz). Δηλωσα arguments (συχνοτητα,ενταση) και τα απαραιτητα variables ωστε να γραψω τον κωδικα για τη δημιουργια SynthDef.Επισης χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 2 δευτερολεπτα κι επειτα σβηνεται απο το server με το doneaction2). Σ αυτο το παραδειγμα δημιουργισα αρμονικες.

//1st Sound (Waveshaping)
b = Buffer.alloc(s, 2048);
(
~sig = Signal.sineFill(1024, [1, 1/4, 1/6, 1/2], [0,0,0,0]);
~wt = ~sig.asWavetable;
b.loadCollection(~wt)
)
(
SynthDef(\sound11, {|amp = 0.5|
	var sig1, env, sum;
	sig1 = Osc.ar(b, LFNoise0.kr(4).exprange(500, 1000), 0, 0.5);
	env = Line.kr(1, 0 ,6, doneAction:2);
	sum = sig1 * env;
	Out.ar([0,1], sum)
}).play;
)
//Buffer που του έχω προγραμματίσει τέσσερις συχνότητες, tη πρώτη, η δεύτερη είναι το 1/4 της πρώτης, η τρίτη είναι το 1/6 της πρώτης και η τέταρτη είναι το μισό της πρώτης. Και οι τέσσερις έχουν την ίδια ένταση.
//Με βάση το παραπάνο buffer, έχω φτιάξει ένα σήμα στο οποίο για συχνότητα έχω βάλει ένα LFNoice που παράγει 4 τυχαίες συχνότητες απο 500 μέχρι 1000.
//Δηλωσα buffer με 4 συχνοτητες(αρχικη,1/4 της πρωτης,1/6 της πρωτης,1,2 της πρωτης) με ιδιες εντασεις. Waveshaping με χρηση ταλαντωτη του οποιου η συχνοτητα ειναι 4 τυχαιες τιμες σε δοσμενο ευρος(50-1000Hz) με το LFNoise και το exprange. Δηλωσα arguments (ενταση) και τα απαραιτητα variables για τη δημιουργια του SynthDef Χρησιμοποιησα envelope για control της εντασης(aαπο το 1 στο 0 σε 6 δευτερολεπτα κι επειτα σβηνεται απο το server)

//2nd Sound (Waveshaping)
(
b.sine3(
	({exprand(0.75,40)}!16).sort,
	({exprand(0.05,0.9)}!16).sort.reverse,
	{rrand(0,2pi)}! 16,
     asWavetable:true
);
)
{Osc.ar(b, MouseX.kr(500, 1000, 2), 0)}.play;
//(καλυτερα με χαμηλα την ενταση)

//3rd Sound (Waveshaping)
b = Buffer.alloc(s, 512, 1, { |buf| buf.chebyMsg([1,0,1,1,0,1])});
(
SynthDef(\Sound3, {|freq = 50, amp = 0.5|
	var sound3, env, sum;
	Shaper.ar(
		b,
		sound3 = SinOsc.ar(freq, 0, Line.kr(0, 1, 6) +  Saw.ar(freq+4, Line.kr (0, 1, 6))), amp);
	env = Line.kr(1, 0, 4, doneAction:2);
	sum = sound3 * env;
	Out.ar([0,1], sum)
}).play;
)
//Waveshaping με χρηση ημιτονοειδους ταλαντωτη στον οποιο εχω προσθεσει πριωνοτο ταλαντωτη με διαμορφωμενη συχνοτητα και ενταση. Δηλωσα arguments(συχνοτητα και ενταση) και τα απαραιτητα arguments για τη δημιουργια SynthDef. Χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 4 δευτερολεπτα) κι επειτα διαγραφεται απο το server.

//4 Sound (Waveshaping)
b = Buffer.alloc(s, 512, 1, { |buf| buf.chebyMsg([1,0,1,1,0,1])});
(
SynthDef(\Sound2, {|freq = 50, amp = 0.5|
	var sound, env, sum;
	Shaper.ar(
		b,
		sound = LFTri.ar(LFNoise0.kr(8).exprange(80, 680), 0, Line.kr(0, 1, 6)), amp);
	env = Line.kr(1, 0, 5, doneAction:2);
	sum = sound * env;
	Out.ar([0,1], sum)
}).play;
)
//Waveshaping με χρηση ταλαντωτη για του οποιου τη συχνοτητα επιλεγονται 8 τυχαιες συχνοτητες σε δοσμενο ευρος (80-680Hz) με το LFNoise0 και το exprange. Δηλωσα arguments(συχνοτητα και ενταση) και τα απαραιτητα arguments για τη δημιουργια SynthDef. Χρησιμοποιησα envelope για control των εντασεων(απο το 1 στο 0 σε 5 δευτερολεπτα) κι επειτα διαγραφεται απο το server.