s.boot

//1st Sound(Short)
(
SynthDef(\sound1, {|freq = 440, amp = 0.5|
	var s , env, sum;
	s = SinOsc.ar(freq, 0, amp);
	env = Line.kr(0.8, 1, 2, doneAction:2);
	sum = s + env;
	Out.ar([0,1], sum)
}).play;
)
//Προσθετικη συνθεση με χρηση ημιτονοειδους ταλαντωτη και envelope για control της εντασης (απο το 0.8 στο 1 σε 2 δευτερολεπτα κι επειτα διαγραφεται απο το server)

//2nd Sound (Short)
(
SynthDef(\sound2, {|freq = 500, amp = 0.5|
	var s2, env, sum;
	s2 = Saw.ar(freq, amp);
	env = Line.kr(0, 1, 3, doneAction:2);
	sum = (s2 + env) + WhiteNoise.ar(0.2);
	Out.ar([0,1], sum)
}).play;
)
//Προσθετικη συνθεση με χρηση πριωνοτου ταλαντωτη και envelope για control της εντασης(απο το 0 στο 1 σε 3 δευτερολεπτα κι επειτα διαγραφεται απο το server),το` οποιο περιεχει και white noise.

//3rd Sound (Short)
(
SynthDef(\sound3, {|freq = 220, amp = 0.2|
	var s3, env, sum;
	s3 = SinOsc.ar(freq, 0, amp);
	env = Line.kr(0, 0.2, 3, doneAction:2);
	sum = s3 / env;
	Out.ar([0,1], sum)
}).play;
)
//[καλυτερα με χαμηλα την ενταση] Διαιρετικη συνθεση με χρηση ημιτονοειδους καμπυλης και χρηση envelope για control της εντασης(απο το 0 στο 0.2 σε 3 δευτερολεπτα κι επειτα διαγραφεται απο το server)

//4rth Sound (Short)
(
SynthDef(\sound4, {
	|freq1 = 600, freq2 = 300, dur1 = 0.01, dur2 = 0.2, cur1 = 1, cur2 = (-1), atk = 0.01, rel = 1, c1 = 1, c2 = (-12), amp = 0.5|
	var s4, env, sum;
	s4 = Env([freq1, freq2], [dur1, dur2],[cur1, cur2]).ar;
	env = Env([0, 1, 1],[atk, rel], [c1, c2]).kr(2);
	sum = SinOsc.ar(s4, pi/2);
	sum = sum * env;
	sum = Pan2.ar(sum, 0, amp);
	Out.ar([0,1], sum);
}).play;
)
//Δηλωσα arguments(για τη συχνοτητα, το σχημα της καμπυλης, το attack,το release τη διαρκεια και την ενταση) καθως και τις variables που χρειαζοταν για να γραψω το κωδικα. Το pi/2 χρισημοποιειται για τη μεταβαση απο την αρχικη συχνοτητα στη δευτερη(σε 0.01 δευτερόλεπτα και να ξανα-μεταβενει στη τριτη συχνοτητα σε 0.2 δευτερολεπτα εχωντας συνολικη διαρκεια 1δευτερολεπτο) και με την εντολη pan2 εχουμε τη δυνατοτητα να βγαινει ο ηχος στο κεντρο.

//5th Sound (Short)
(
SynthDef(\sound5, {
	|freq1 = 2000, freq2 = 800, freq3 = 8000, dur1 = 0.01, dur2 = 0.2, cur1 = 1, cur2 = (-1), atk = 0.01, rel = 2, c1 = 1, c2 = (-12), amp = 0.5|
	var s5, env, sum;
	s5 = Env([freq1, freq2, freq3], [dur1, dur2],[cur1, cur2]).ar;
	env = Env([0, 1, 0],[atk, rel], [c1, c2]).kr(2);
	sum = SinOsc.ar(s5, pi/2);
	sum = sum * env;
	sum = Pan2.ar(sum, 0, amp);
	Out.ar([0,1], sum);
}).play;
)
//Δηλωσα arguments(για τη συχνοτητα, το σχημα της καμπυλης, το attack,το release τη διαρκεια και την ενταση) καθως και τις variables που χρειαζοταν για να γραψω το κωδικα.  Το pi/2 χρισημοποιειται για τη μεταβαση απο την αρχικη συχνοτητα στη δευτερη(σε 0.01 δευτερόλεπτα και να ξανα-μεταβαινει στη τριτη συχνοτητα σε 0.2 δευτερολεπτα εχωντας συνολικη διαρκεια 2δευτερολεπτα) και με την εντολη pan2 εχουμε τη δυνατοτητα να βγαινει ο ηχος στο κεντρο.

//6th Sound (Short)
(
SynthDef(\sound6, {|freq = 880, amp = 0.55|
	var s6, env, sum;
	s6 = SinOsc.ar(freq, 0, amp);
	env = Line.kr(0, 1, 2, doneAction:2);
	sum = s6 * env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτική σύνθεση με χρηση ημιτονοειδους ταλαντωτη και envelope για control της εντασης(απο το 0 στο 1 σε 2 δευτερολεπτα κι επειτα διαγραφεταΙ απο το server)

//7th Sound (Short)
(
SynthDef(\sound7, {|freq = 30, amp = 0.05|
	var s7, env, sum;
	s7 = Saw.ar(freq, amp) / SinOsc.ar(freq + 20, 0.5, amp/4);
	env = Line.kr(0, 0.4, 1, doneAction:2);
	sum = s7 * env;
	Out.ar([0,1], sum)
}).play;
)
// Διαιρετικη συνθεση με χρηση πριωνοτου ταλαντωτη, διαιρεμενου με ημιτονοειδη ταλαντωτη, στον οποιο εχω διαμορφωσει την αρχικη συχνοτητα(+20hz),την φαση(στο 0.5) και την αρχικη ενταση( /4 ). Επισης χρησιμοποιειται envelope για control της εντασης(απο το 0 στο 0.4 σε 1 δευτερολεπτα κι επειτα διαγραφεται απο το server).

//8th Sound (Short)
(
SynthDef(\sound8, {|freq = 440, amp = 0.05|
	var s8, env, sum;
	s8 = Saw.ar(freq, amp) / SinOsc.ar(freq + 200, 0.5, amp/2);
	env = Line.kr(0, 1, 1, doneAction:2);
	sum = (s8 * env) / PinkNoise.ar(0.125);
	Out.ar([0,1], sum)
}).play;
)
//[καλυτερα με χαμηλα την ενταση] Διαιρετικη συνθεση με χρηση πριωνοτου ταλαντωτη, διαιρεμενου με ημιτονοειδη ταλαντωτη, στον οποιο εχω διαμορφωσει την αρχικη συχνοτητα(+200hz) και την αρχικη ενταση(/2 ). Επισης χρησιμοποιειται envelope για control της εντασης(απο το 0 στο 1 σε 1 δευτερολεπτα κι επειτα διαγραφεται απο το server)και διαιρειται στο τελος,ολο μαζι,με pink noise.

//9th Sound (Short)
(
SynthDef(\sound9, {|amp = 0.5|
	var s9, env, p, sum;
	s9 = Saw.ar(LFNoise0.kr(2).exprange (200, 350), amp);
	p = Pulse.ar(ExpRand(30, 500));
	env = Line.kr(0, 1, 5, doneAction:2);
	sum = (s9 * p) + env;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη συνθεση με χρηση πριωνοτου ταλαντωτη στον οποιο παραγονται τυχαιοι ηχοι μεταξυ 200hz και 350hz με το LFNoise0 και Puls με envelope για control της εντασης(απο το 0 στο 1 σε 5 δευτερόλεπτα κι επειτα διαγραφεται απο το server).

//10th Sound (Short)
(
SynthDef(\sound10, {
	|freq1 = 200, freq2 = 50, freq3 = 10, dur1 = 0.01, dur2 = 0.2, cur1 = 1, cur2 = (-1), atk = 0.01, rel = 1, c1 = 1, c2 = (-12), amp = 1|
	var s10, env, sum;
	s10 = Env([freq1, freq2, freq3], [dur1, dur2],[cur1, cur2]).ar;
	env = Env([0, 1, 1],[atk, rel], [c1, c2]).kr(2);
	sum = SinOsc.ar(s10, pi/2);
	sum = sum * env;
	sum = Pan2.ar(sum, 0, amp);
	Out.ar([0,1], sum);
}).play;
)
//Αποπειρα κατασκευης μπασου απο ντραμς.


//1st Sound (Sustained)
(
SynthDef(\sound1, {
	var s1, s2, freq1, freq2, amp1, amp2;
	freq1 = LFNoise0.kr(4).exprange(500, 800);
	freq2 = LFNoise0.kr(4).exprange(500, 800);
	amp1 = SinOsc.kr(4, 0, 0.12) * 0.75;
	amp2 = SinOsc.kr(4, 0.5, 0.12) * 0.75;
	s1 = LFPulse.ar(freq1, 0.5, amp1);
	s2 = LFPulse.ar(freq2, 0.5, amp2);
	s1 = FreeVerb.ar(s1, 0.85, 0.8, 0.25);
	s2 = FreeVerb.ar(s2, 0.85, 0.8, 0.25);
	Out.ar(0, s1);
	Out.ar(1, s2);
}).play;
)
//Με το LFNoise0 και το exprange παραγονται 4 ηχοι το δευτερολεπτο σε δωσμενο ευρος τιμων με τη βοηθεια δυο αρχικων ιδιων ηχων (με το SinOsc)εκ των οποιων ο ενας χει διαφορα φασης 0.5 απο τον αλλο. Με το FreeVerb εχουμε βαθος στο τελικο αποτελεσμα σε στερεοφωνια.

//2nd Sound (Sustained)
(
SynthDef(\sound2, {
	var s3, s4, freq1, freq2, amp1, amp2;
	freq1 = LFNoise0.kr(4).exprange(220, 440);
	freq2 = LFNoise0.kr(4).exprange(220, 440);
	amp1 = Saw.kr(4, 0, 0.12) * 0.7;
	amp2 = Saw.kr(4, 0.5, 0.12) * 0.7;
	s3 = LFPulse.ar(freq1, 0.5, amp1);
	s4 = LFPulse.ar(freq2, 0.5, amp2);
	s3 = FreeVerb.ar(s3, 1, 0.8, 0.2);
	s4 = FreeVerb.ar(s4, 1, 0.8, 0.2);
	Out.ar(0, s3);
	Out.ar(1, s4);
}).play;
)
//Με το LFNoise0 και το exprange παραγονται 4 ηχοι το δευτερολεπτο με τη βοηθεια δυο αρχικων ιδιων ηχων (με το Saw)εκ των οποιων ο ενας χει διαφορα φασης 0.5 απο τον αλλο. Με το FreeVerb εχουμε βαθος στο τελικο αποτελεσμα σε στερεοφωνια.

//3rd Sound (Sustained)
(
SynthDef(\sound3, {
	var s5, s6, freq1, freq2, amp1, amp2;
	freq1 = LFNoise0.kr(4).exprange(330, 660);
	freq2 = LFNoise0.kr(4).exprange(330, 660);
	amp1 = LFPulse.kr(4, 0, 0.12) * 0.5;
	amp2 = LFPulse.kr(4, 0.5, 0.12) * 0.5;
	s5 = LFPulse.ar(freq1, 0.5, amp1);
	s6 = LFPulse.ar(freq2, 0.5, amp2);
	s5 = FreeVerb.ar(s5, 0.7, 0.8, 0.25);
	s6 = FreeVerb.ar(s6, 0.7, 0.8, 0.25);
	Out.ar(0, s5);
	Out.ar(1, s6);
}).play;
)
//Με το LFNoise0 και το exprange παραγονται 4 ηχοι το δευτερολεπτο με τη βοηθεια δυο αρχικων ιδιων ηχων (με το Pulse)εκ των οποιων ο ενας χει διαφορα φασης 0.5 απο τον αλλο. Με το FreeVerb εχουμε περισσοτερο βαθος στο τελικο αποτελεσμα σε στερεοφωνια.

//4th Sound (Sustained)
(
SynthDef(\sound4, {|freq = 88, amp = 0.65|
	var s7, s8;
	s7 = SinOsc.ar(freq, 0, amp);
	s8 = SinOsc.ar(freq, 0.5, amp) * Saw.ar(freq/2, amp/2);
	Out.ar(0, s7);
	Out.ar(1, s8);
}).play;
)
//Διαμορφωτικη συνθεση με 2 ημιτονοειδης ταλαντωτες ο ενας εκτως φασης(0.5) απο τον αλλο με το δευτερο διαμορφωμενο απο πριωνοτο ταλαντωτη του οποιου ειναι μειωμενες(/2) η συχνοτητα και η ενταση.

//5th Sound (Sustained)
(
SynthDef(\sound5, {|amp = 0.05|
	var s9, p, sum;
	s9 = SinOsc.ar(LFNoise0.kr(8).exprange (100, 150), amp);
	p = SinOsc.ar(ExpRand(30, 500),MouseX.kr(-128, 128));
	sum = s9 / p;
	Out.ar([0,1], sum)
}).play;
)

//6th Sound (Sustained)
(
SynthDef(\sound6, {|amp = 0.5|
	var s9, p, sum;
	s9 = SinOsc.ar(LFNoise0.kr(6).exprange (660, 1260), amp);
	p = SinOsc.ar(ExpRand(40,700));
	sum = s9 / p;
	Out.ar([0,1], sum)
}).play;
)
//[καλυτερα με χαμηλα την ενταση] Διαιρετικη συνθεση ενος ημιτονοειδους ταλαντωτη του οποιου η συχνοτητα ειναι 6 τυχαιοι ηχοι το δευτερολεπτο σε δωσμενα πλαιδια (με το LFNoise0 και το ExpRand)με εναν εξισου ημιτονοειδη ταλαντωτη με εξισου δωσμενα πλαισια.

//7th Sound (Sustained)
(
SynthDef(\sound7, {|amp = 0.5|
	var s10, p, sum;
	s10 = Saw.ar(LFNoise0.kr(4).exprange (220, 440), amp);
	p = Pulse.ar(ExpRand(40,200));
	sum = s10 * p;
	Out.ar([0,1], sum)
}).play;
)
//Διαμορφωτικη συνθεση ενος πριωνοτου ταλαντωτη του οποιου η συχνοτητα ειναι 4 τυχαιοι ηχοι το δευτερολεπτο σε δωσμενα πλαιδια (με το LFNoise0 και το ExpRand)με εναν παλμικο ταλαντωτη με εξισου δωσμενα πλαισια.

//8th Sound (Sustained)
(
SynthDef(\sound8, {
	var s11, s12, freq1, freq2, amp1, amp2;
	freq1 = LFNoise0.kr(4).exprange(100, 200);
	freq2 = LFNoise0.kr(12).exprange(3000, 4000);
	amp1 = SinOsc.kr(4, 0, 0.12) * 0.4;
	amp2 = Saw.kr(4, 0.5, 0.12) * 0.7;
	s11 = Saw.ar(freq1, 0.5, amp1);
	s12 = SinOsc.ar(freq2, 0.5, amp2);
	s11 = FreeVerb.ar(s11, 0.3, 0.8, 0.25);
	s12 = FreeVerb.ar(s12, 0.3, 0.8, 0.25);
	Out.ar(0, s11);
	Out.ar(1, s12);
}).play;
)
//Με το LFNoise0 και το exprange παραγονται 4 και 12 ηχοι το δευτερολεπτο με τη βοηθεια δυο αρχικων ηχων(με το Saw και το SinOsc)εκ των οποιων ο ενας εχει διαφορα φασης 0.5 απο τον αλλο και εχουν διαφορετικα διαμορφωμενες εντασεις. Με το FreeVerb εχουμε περισσοτερο βαθος στο τελικο αποτελεσμα σε στερεοφωνια.

//9 Sound (Sustained)
(
SynthDef(\sound9, {
	var s13, s14, freq1, freq2, amp1, amp2;
	freq1 = LFNoise0.kr(8).exprange(2000, 2500);
	freq2 = LFNoise0.kr(8).exprange(2000, 2500);
	amp1 = LFPulse.kr(4, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(4, 0.5, 0.12) * 0.75;
	s13 = Saw.ar(freq1, 0.5, amp1);
	s14 = Saw.ar(freq2, 0.5, amp2);
	s13 = FreeVerb.ar(s13, 0.9, 0.8, 0.25);
	s14 = FreeVerb.ar(s14, 0.9, 0.8, 0.25);
	Out.ar(0, s13);
	Out.ar(1, s14);
}).play;
)
//Με το LFNoise0 και το exprange παραγονται 8 ηχοι το δευτερολεπτο με τη βοηθεια δυο αρχικων ιδιων ηχων (με το Saw)εκ των οποιων ο ενας χει διαφορα φασης 0.5 απο τον αλλο. Με το FreeVerb εχουμε περισσοτερο βαθος στο τελικο αποτελεσμα σε στερεοφωνια.

//10th Sound (Sustained)
(
SynthDef(\sound10, {
	var s15, s16, freq1, freq2, amp1, amp2;
	freq1 = LFNoise0.kr(8).exprange(1000, 2500);
	freq2 = LFNoise0.kr(8).exprange(1000, 2500);
	amp1 = LFPulse.kr(4, 0, 0.12) * 0.75;
	amp2 = LFPulse.kr(4, 0.5, 0.12) * 0.75;
	s15 = SinOsc.ar(freq1, 0.5, amp1);
	s16 = SinOsc.ar(freq2, 0.5, amp2);
	s15 = FreeVerb.ar(s15, 0.9, 0.8, 0.25);
	s16 = FreeVerb.ar(s16, 0.9, 0.8, 0.25);
	Out.ar(0, s15);
	Out.ar(1, s16);
}).play;
)
//Με το LFNoise0 και το exprange παραγονται 8 ηχοι το δευτερολεπτο με τη βοηθεια δυο αρχικων ιδιων ηχων (με το SinOsc)εκ των οποιων ο ενας χει διαφορα φασης 0.5 απο τον αλλο. Με το FreeVerb εχουμε περισσοτερο βαθος στο τελικο αποτελεσμα σε στερεοφωνια.