!classDefinition: #CarmenSandiegoTest category: #'CarmenSandiego-Test'!
TestCase subclass: #CarmenSandiegoTest
	instanceVariableNames: 'aClassicDetective argentina spain argentinianWitness spanishWitness aCountryWithWitnessWithoutClues aDetectiveInCluelessCountry guiltySuspect collectionOfSuspects notGuiltySuspect lostState wonState progressState aPersuasiveDetective anInterpolDetective portugal france uruguay anotherArgentinianWitness suspects someSuspect arrayOfCountriesWhereSuspectWas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Test'!

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:09:37'!
test01aClassicDetectiveAskToAWitnessAndLoseTime
	aClassicDetective askTo: argentinianWitness.
	Assert that: aClassicDetective remainingTime isEqualTo: 28.
! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:02:08'!
test02aPersuasiveDetectiveAskForCluesAndLoseTime
	aPersuasiveDetective askTo: argentinianWitness.
	Assert that: aPersuasiveDetective remainingTime isEqualTo: 24.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:02:17'!
test03anInterpolDetectiveAskForCluesAndLoseTime
	anInterpolDetective askTo: argentinianWitness.
	Assert that: anInterpolDetective remainingTime isEqualTo: 23.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:09:44'!
test04aClassicDetectiveTravelToBorderingCountryAndLoseTime
	aClassicDetective travelTo: uruguay.
	aPersuasiveDetective travelTo: uruguay.
	anInterpolDetective travelTo: uruguay.
	Assert that: aClassicDetective remainingTime isEqualTo: 23.
	Assert that: aPersuasiveDetective remainingTime isEqualTo: 18.
	Assert that: anInterpolDetective remainingTime isEqualTo: 20.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:04:14'!
test05aPersuasiveDetectiveTravelToBorderingCountryAndLoseTime
	aPersuasiveDetective travelTo: uruguay.
	Assert that: aPersuasiveDetective remainingTime isEqualTo: 18.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:04:41'!
test06anInterpolDetectiveTravelToBorderingCountryAndLoseTime
	aClassicDetective travelTo: uruguay.
	aPersuasiveDetective travelTo: uruguay.
	anInterpolDetective travelTo: uruguay.
	Assert that: aClassicDetective remainingTime isEqualTo: 23.
	Assert that: aPersuasiveDetective remainingTime isEqualTo: 18.
	Assert that: anInterpolDetective remainingTime isEqualTo: 20.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:09:51'!
test07aClassicDetectiveAskCluesAndSaveIt
	aClassicDetective askTo: argentinianWitness.
	aClassicDetective askTo: argentinianWitness.
	
	Assert isTrue: ( guiltySuspect clues includes: (aClassicDetective clues at: 1) ).
	Assert isTrue: ( guiltySuspect clues includes: (aClassicDetective clues at: 2) ).! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:07:22'!
test08aPersuasiveDetectiveAskCluesAndSaveIt
	aPersuasiveDetective askTo: argentinianWitness.
	Assert isTrue: ( guiltySuspect clues includes: (aPersuasiveDetective clues at: 1) ).
	Assert isTrue: ( guiltySuspect clues includes: (aPersuasiveDetective clues at: 2) ).! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:07:46'!
test09anInterpolDetectiveAskCluesAndSaveIt
	anInterpolDetective askTo: argentinianWitness.
	anInterpolDetective askTo: argentinianWitness.
	Assert isTrue: ( guiltySuspect clues includes: (anInterpolDetective clues at: 1) ).
	Assert isTrue: ( guiltySuspect clues includes: (anInterpolDetective clues at: 2) ).! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 18:31:57'!
test10aClassicDetectiveAskCluesButFailBecauseWitnessHasNoMoreClues
	aClassicDetective askTo: argentinianWitness.
	aClassicDetective askTo: argentinianWitness.
	
	Assert should: [ aClassicDetective askTo: argentinianWitness. ]
			signal: Error
			withDescription: WitnessWithClues noMoreCluesMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 18:31:57'!
test11aPersuasiveDetectiveAskCluesButFailBecauseWitnessHasNoMoreClues
	aPersuasiveDetective askTo: argentinianWitness.
	
	Assert should: [ aPersuasiveDetective askTo: argentinianWitness. ]
			signal: Error
			withDescription: WitnessWithClues noMoreCluesMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 18:31:57'!
test12anInterpolDetectiveAskCluesButFailBecauseWitnessHasNoMoreClues
	anInterpolDetective askTo: argentinianWitness.
	anInterpolDetective askTo: argentinianWitness.
	
	Assert should: [ anInterpolDetective askTo: argentinianWitness. ]
			signal: Error
			withDescription: WitnessWithClues noMoreCluesMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:21:53'!
test13aNewCountryHasThreeWitness	
	Assert that: aCountryWithWitnessWithoutClues witnesses size isEqualTo: 3.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:22:54'!
test14aNewCountryHasWitnessesWithoutClues	
	Assert isFalse: (aCountryWithWitnessWithoutClues witnesses at: 1) hasClues. 
	Assert isFalse: (aCountryWithWitnessWithoutClues witnesses at: 2) hasClues.
	Assert isFalse: (aCountryWithWitnessWithoutClues witnesses at: 3) hasClues.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/23/2020 19:30:21'!
test15aCountryGiveClueToWitnesses
	aCountryWithWitnessWithoutClues giveWitnessesCountryCluesFrom: arrayOfCountriesWhereSuspectWas andSuspectCluesFrom: someSuspect.
	Assert isTrue: (aCountryWithWitnessWithoutClues witnesses at: 1) hasClues. 
	Assert isTrue: (aCountryWithWitnessWithoutClues witnesses at: 2) hasClues.
	Assert isTrue: (aCountryWithWitnessWithoutClues witnesses at: 3) hasClues.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:34:28'!
test16aClassicDetectiveAskForCluesToWitnessWithoutClues
	aClassicDetective travelTo: aCountryWithWitnessWithoutClues.
	aClassicDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1).
	Assert isTrue: aClassicDetective clues isEmpty.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:35:12'!
test17aPersuasiveDetectiveAskForCluesToWitnessWithoutClues
	aPersuasiveDetective travelTo: aCountryWithWitnessWithoutClues.
	aPersuasiveDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1).
	Assert isTrue: aPersuasiveDetective clues isEmpty.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/18/2020 19:35:28'!
test18anInterpolDetectiveAskForCluesToWitnessWithoutClues
	anInterpolDetective travelTo: aCountryWithWitnessWithoutClues.
	anInterpolDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1).
	Assert isTrue: anInterpolDetective clues isEmpty.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 18:45:53'!
test19aClassicDetectiveAskForCluesToWitnessWithoutCluesTwiceAndFail
	aClassicDetective travelTo: aCountryWithWitnessWithoutClues.
	aClassicDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1).
	
	Assert should: [ aClassicDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1). ]
			signal: Error
			withDescription: WitnessWithoutClues hasBeenAlreadyAskedMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:15:25'!
test20witnessesKnowsWhereTheyFrom
	Assert isTrue: (argentinianWitness isFrom: argentina). 
	Assert isFalse: (spanishWitness isFrom: argentina).
	Assert isFalse: (argentinianWitness isFrom: spain).! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:16:15'!
test21aClassicDetectiveAskClueToWitnessThatItsNotInCurrentCountry

	Assert should: [ aClassicDetective askTo: spanishWitness  ]  
			signal: Error
			withDescription: ClassicDetective witnessIsNotInCurrentCountryMessage ! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:16:48'!
test22aPersuasiveDetectiveAskClueToWitnessThatItsNotInCurrentCountry

	Assert should: [ aPersuasiveDetective askTo: spanishWitness  ]  
			signal: Error
			withDescription: ClassicDetective witnessIsNotInCurrentCountryMessage ! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:16:58'!
test23anInterpolDetectiveAskClueToWitnessThatItsNotInCurrentCountry

	Assert should: [ anInterpolDetective askTo: spanishWitness  ]  
			signal: Error
			withDescription: ClassicDetective witnessIsNotInCurrentCountryMessage ! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:17:38'!
test24aClassicDetectiveTravelToSpainAndAskClueToWitnessThatItsInArgentina
	
	aClassicDetective travelTo: spain.
	
	Assert should: [ aClassicDetective askTo: argentinianWitness ]  
			signal: Error
			withDescription: ClassicDetective witnessIsNotInCurrentCountryMessage ! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:18:11'!
test25aPersuasiveDetectiveTravelToSpainAndAskClueToWitnessThatItsInArgentina
	
	aPersuasiveDetective travelTo: spain.
	
	Assert should: [ aPersuasiveDetective askTo: argentinianWitness ]  
			signal: Error
			withDescription: ClassicDetective witnessIsNotInCurrentCountryMessage ! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:18:25'!
test26anInterpolDetectiveTravelToSpainAndAskClueToWitnessThatItsInArgentina
	
	anInterpolDetective travelTo: spain.
	
	Assert should: [ anInterpolDetective askTo: argentinianWitness ]  
			signal: Error
			withDescription: ClassicDetective witnessIsNotInCurrentCountryMessage ! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:19:33'!
test27aSuspectHasAttributesThatLaterHePassThemAsClues
	| aSuspect clues |
	
	aSuspect := Suspect withEyeColor: 'brown'
						hairShape: 'watty'
						hairColor: 'blonde'
						bodyType: 'fat'
						gender: 'male'
						height: '1.98'.
	clues := { 
		'brown eye color' .
		'watty hair shape' .
		'blonde hair color' .
		'fat body type'.
		'male gender'.
		'1.98 height'
	 } asBag.
	
	Assert that: aSuspect clues asBag isEqualTo: clues.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:08:07'!
test28aClassicDetectiveEmitWarrantToCorrectSuspect
	aClassicDetective emitWarrant: guiltySuspect.
	Assert that: aClassicDetective result isEqualTo: wonState result.
	! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:21:28'!
test29aPersuasiveDetectiveEmitWarrantToCorrectSuspect
	aPersuasiveDetective emitWarrant: guiltySuspect.
	Assert that: aPersuasiveDetective result isEqualTo: wonState result.
	! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:09:35'!
test30anInterpolDetectiveEmitWarrantToCorrectSuspect
	anInterpolDetective emitWarrant: guiltySuspect.
	Assert that: anInterpolDetective result isEqualTo: wonState result.
	! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:09:41'!
test31aClassicDetectiveEmitWarrantToIncorrectSuspect
	aClassicDetective emitWarrant: notGuiltySuspect.
	Assert that: aClassicDetective result isEqualTo: lostState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:09:47'!
test32aPersuasiveDetectiveEmitWarrantToIncorrectSuspect
	aPersuasiveDetective emitWarrant: notGuiltySuspect.
	Assert that: aPersuasiveDetective result isEqualTo: lostState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:09:53'!
test33anInterpolDetectiveEmitWarrantToIncorrectSuspect
	anInterpolDetective emitWarrant: notGuiltySuspect.
	Assert that: anInterpolDetective result isEqualTo: lostState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:09:59'!
test34aClassicDetectiveWithNoMoreRemainingTime
	
	| aDetectiveWithFewTime |
	aDetectiveWithFewTime := ClassicDetective withInitialTime: 2 startsIn: argentina withSuspects: suspects.
	aDetectiveWithFewTime askTo: argentinianWitness.
	
	Assert that: aDetectiveWithFewTime result isEqualTo: lostState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 20:10:04'!
test35aPersuasiveDetectiveWithNoMoreRemainingTime
	
	| aDetectiveWithFewTime |
	aDetectiveWithFewTime := PersuasiveDetective withInitialTime: 2 startsIn: argentina withSuspects: suspects.
	aDetectiveWithFewTime askTo: argentinianWitness.
	aDetectiveWithFewTime askTo: anotherArgentinianWitness.
	
	Assert that: aDetectiveWithFewTime result isEqualTo: lostState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 18:51:43'!
test36anInterpolDetectiveWithNoMoreRemainingTime
	
	| aDetectiveWithFewTime |
	aDetectiveWithFewTime := InterpolDetective withInitialTime: 2 startsIn: argentina withSuspects: suspects .
	aDetectiveWithFewTime askTo: argentinianWitness.
	
	Assert that: aDetectiveWithFewTime result isEqualTo: lostState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:24:57'!
test37aClassicDetectiveInProgress
	Assert that: aClassicDetective result isEqualTo: progressState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:25:16'!
test38aPersuasiveDetectiveInProgress
	Assert that: aPersuasiveDetective result isEqualTo: progressState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:25:24'!
test39anInterpolDetectiveInProgress
	Assert that: anInterpolDetective result isEqualTo: progressState result.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:25:58'!
test40countriesHasLimitsWithOtherCountries
	Assert isTrue: (portugal isBorderingCountry: france).
	Assert isTrue: (france isBorderingCountry: portugal).! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:26:36'!
test41aClassicDetectiveTravelToNoLimitCountry
	aClassicDetective travelTo: france.
	Assert that: aClassicDetective remainingTime isEqualTo: 20.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:26:48'!
test42aPersuasiveDetectiveTravelToNoLimitCountry
	aPersuasiveDetective travelTo: portugal.
	Assert that: aPersuasiveDetective remainingTime isEqualTo: 15.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 17:26:55'!
test43anInterpolDetectiveTravelToNoLimitCountry
	anInterpolDetective travelTo: portugal.
	Assert that: anInterpolDetective remainingTime isEqualTo: 17.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/23/2020 19:17:35'!
test44aClassicDetectiveEmitWarrantToSuspectThatItsNotInHisList
	Assert should: [ aClassicDetective emitWarrant: someSuspect ] 
			signal: Error
			withDescription: Detective notValidSuspectMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/23/2020 19:17:31'!
test45aPersuasiveDetectiveEmitWarrantToSuspectThatItsNotInHisList
	Assert should: [ aPersuasiveDetective emitWarrant: someSuspect ] 
			signal: Error
			withDescription: Detective notValidSuspectMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 11/20/2020 18:59:25'!
test46anInterpolDetectiveEmitWarrantToSuspectThatItsNotInHisList

	Assert should: [ anInterpolDetective emitWarrant: someSuspect ] 
			signal: Error
			withDescription: Detective notValidSuspectMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 18:46:24'!
test47aPersuasiveDetectiveAskForCluesToWitnessWithoutCluesTwice
	aPersuasiveDetective travelTo: aCountryWithWitnessWithoutClues.
	aPersuasiveDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1).
	
	Assert should: [aPersuasiveDetective askTo: (aCountryWithWitnessWithoutClues witnesses at: 1)] 
			signal: Error  
			withDescription: WitnessWithoutClues hasBeenAlreadyAskedMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 19:32:30'!
test48aClassicDetectiveCannotStartInACluelessCountry
	Assert should: [ClassicDetective withInitialTime: 10 startsIn: aCountryWithWitnessWithoutClues withSuspects: suspects] 
		signal: Error  
		withDescription: Detective startingCountryHasCluelessWitnessesMessage .! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 19:32:35'!
test49aPersuasiveDetectiveCannotStartInACluelessCountry
	Assert should: [PersuasiveDetective withInitialTime: 30 startsIn: aCountryWithWitnessWithoutClues withSuspects: suspects] 
			signal: Error  
			withDescription: Detective startingCountryHasCluelessWitnessesMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 19:32:39'!
test50anInterpolDetectiveCannotStartInACluelessCountry
		Assert should: [InterpolDetective withInitialTime: 10 startsIn: aCountryWithWitnessWithoutClues withSuspects: suspects] 
			signal: Error  
			withDescription: Detective startingCountryHasCluelessWitnessesMessage.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 19:46:51'!
test51aClassicDetectiveCannotStartWithInvalidTime
	Assert should: [ClassicDetective withInitialTime: -5 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 2).

	Assert should: [ClassicDetective withInitialTime: 0 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 2).
		
	Assert should: [ClassicDetective withInitialTime: 1 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 2).! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 19:48:52'!
test52aPersuasiveDetectiveCannotStartWithInvalidTime
	Assert should: [PersuasiveDetective withInitialTime: -2  startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 1) .

	Assert should: [PersuasiveDetective withInitialTime: 0 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 1).
		
	Assert shouldNot: [PersuasiveDetective withInitialTime: 1 startsIn: argentina withSuspects: suspects] 
		signal: Error.! !

!CarmenSandiegoTest methodsFor: 'tests' stamp: 'las 12/6/2020 19:49:16'!
test53anInterpolDetectiveCannotStartWithInvalidTime
	Assert should: [InterpolDetective withInitialTime: -20 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 2 ).

	Assert should: [InterpolDetective withInitialTime: 0 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 2 ).
		
	Assert should: [InterpolDetective withInitialTime: 1 startsIn: argentina withSuspects: suspects] 
		signal: Error  
		withDescription: (Detective notValidInitialTimeMessage: 2 ).! !


!CarmenSandiegoTest methodsFor: 'setUp' stamp: 'las 11/26/2020 18:35:37'!
setUp
	self setupStates.		
	self setupSuspects.	
	self setupCountries.
	self setupWitnesses.
	self setupDetectives.
	
	
	
	
	
	
	
! !

!CarmenSandiegoTest methodsFor: 'setUp' stamp: 'las 11/26/2020 18:35:06'!
setupCountries

	aCountryWithWitnessWithoutClues := Country withName: 'aName' andClues: #('food' 'water' 'peace').
	argentina := Country withName: 'argentina' andClues: #('tango' 'barbacue' 'empanada').
	uruguay := Country withName: 'uruguay' andClues: #('gardel' 'mate' 'few people').
	spain := Country withName: 'spain' andClues: #('jamon crudo' 'flamenco' 'sagrada familia').
	portugal := Country withName: 'portugal' andClues: #('cr7' 'lisboa' 'little').
	france := Country withName: 'portugal' andClues: #('eiffel' '' 'little').

	arrayOfCountriesWhereSuspectWas := { spain . argentina }.
	
	argentina giveWitnessesCountryCluesFrom: arrayOfCountriesWhereSuspectWas andSuspectCluesFrom: guiltySuspect.
		
	uruguay addBorderingCountry: argentina.
	portugal addBorderingCountry: france! !

!CarmenSandiegoTest methodsFor: 'setUp' stamp: 'las 12/6/2020 19:22:14'!
setupDetectives

	aClassicDetective := ClassicDetective withInitialTime: 30 startsIn: argentina withSuspects: suspects.
	aPersuasiveDetective := PersuasiveDetective withInitialTime: 25 startsIn: argentina withSuspects: suspects.
	anInterpolDetective := InterpolDetective withInitialTime: 25 startsIn: argentina withSuspects: suspects.! !

!CarmenSandiegoTest methodsFor: 'setUp' stamp: 'las 11/26/2020 18:34:27'!
setupStates

	lostState := LostState new.
	wonState := WonState new.
	progressState := ProgressState new! !

!CarmenSandiegoTest methodsFor: 'setUp' stamp: 'las 11/26/2020 18:34:39'!
setupSuspects

	guiltySuspect := GuiltySuspect withEyeColor: 'brown' hairShape: 'watty' hairColor: 'blonde' bodyType: 'fat' gender: 'male' height: '1.98'.
	notGuiltySuspect := NoGuiltySuspect withEyeColor: 'green' hairShape: 'short' hairColor: 'brown' bodyType: 'fit' gender: 'female' height: '1.70'.
	
	someSuspect := Suspect withEyeColor: 'green' hairShape: 'long'  hairColor: 'blonde'  bodyType: 'fit'  gender: 'male' height: '1.65'. 
	
	
	suspects := {
		guiltySuspect .
		notGuiltySuspect .
		NoGuiltySuspect withEyeColor: 'brown' hairShape: 'short' hairColor: 'brown' bodyType: 'fit' gender: 'female' height: '1.75'.
		NoGuiltySuspect withEyeColor: 'green' hairShape: 'long' hairColor: 'blonde' bodyType: 'fat' gender: 'male' height: '1.95'.
		NoGuiltySuspect withEyeColor: 'yellow' hairShape: 'watty' hairColor: 'blue' bodyType: 'fat' gender: 'female' height: '1.60'.
		NoGuiltySuspect withEyeColor: 'brown' hairShape: 'short' hairColor: 'brown' bodyType: 'fit' gender: 'male' height: '1.71'.
	}! !

!CarmenSandiegoTest methodsFor: 'setUp' stamp: 'las 11/26/2020 18:35:25'!
setupWitnesses

	argentinianWitness := (argentina witnesses at: 2).
	anotherArgentinianWitness := (argentina witnesses at: 1).
	spanishWitness := (spain witnesses at: 1)! !
