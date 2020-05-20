s.boot
//1st Sound (Delay)
(
SynthDef(\sound1, {| freq = 200, amp = 0.5, delaytime = 0.2, decaytime = 0.2|
var s, comb, env;
env = XLine.kr(9, 0, 7, doneAction:2);
s = SinOsc.ar(freq, 0, amp) * env;
comb = CombL.ar(s, delaytime, decaytime, 4);
Out.ar([0,1], comb);
}).play;
)
//Comb filter με ημιτονοειδη ταλαντωτη(200Hz) με envelope για την ενταση(απο το 9 στο 0 σε 7 δευτερολεπτα κι επειτα σβηνεται απο το server) με το XLine και το doneAction2. Επισης το τελικο σημα διαμορφωνεται ''γραμμικα'' με delay(0.2'') και decay(0.2'') και πολλαπλασιαζεται με το 4.

//2nd Sound (Tremolo)
(
SynthDef(\sound2, {|freq = 100, amp = 0.02, delaytime = 0.1, decaytime = 0.04|
	var s, comb, env;
	env = Line.kr(2, 0, 5, doneAction:2);
	s = Blip.ar(freq, 50) * env;
	comb = CombN.ar(s, delaytime, decaytime, -20);
	Out.ar([0,1], comb);
}).play;
)
//Στο comb filter δινεται ενα σημα Blip(100Hz) το οποιο πολλαπλασιαζεται με ''γραμμικο'' envelope για control της εντασης(απο το 2 στο 0 σε 5 δευτερολεπτα) με το Line κι επειτα διαγραφεται απο το server με το doneAction2. Με το CombN το τελικο αποτελεσμα δε διαμορφωνεται γραμμικα με το delay(0.1'') και decay(0.04'') και πολλαπλασιαζεται με -20.

// 3rd Sound (Echo)
(
SynthDef(\sound3, {|delaytime = 0.1, decaytime = 0.1|
	var s, comb;
	s = Decay.ar(Dust2.ar(1,0.5), 0.2, WhiteNoise.ar);
	comb = CombC.ar(s, delaytime, decaytime, 3);
	Out.ar([0,1], comb);
}).play;
)
//Στο comb filter δινεται ενα σημα Decay απο WhiteNoise(με decaytime 0.2'') για του οποιου τη συχνοτητα εχουμε 1 τυχαια τιμη(απο -1 ως 1) σε 1 δευτερολεπτο πολλαπλασιαζοντας την με ο.5 με τη βοηθεια του Dust2. Το τελικο αποτελεσμα ειναι διαμορφωμενο ''κυβικα'' με delay(0.1'') και decay(0.1'')και πολλαπλασιαζεται με 3.