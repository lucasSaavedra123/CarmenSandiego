!classDefinition: #Country category: #'CarmenSandiego-Model'!
Object subclass: #Country
	instanceVariableNames: 'name clues witnesses borderingCountries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!Country methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 20:01:47'!
addBorderingCountry: aCountry 
	
	(self isBorderingCountry: aCountry)
		ifFalse: [ borderingCountries add: aCountry.
				aCountry addBorderingCountry: self ]
	! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 12/4/2020 11:39:44'!
clues
	^clues copy shuffled ! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 18:31:57'!
giveWitnessesCountryCluesFrom: aCollectionOfCountries andSuspectCluesFrom: aSuspect
	| suspectClues countryClues |
	witnesses removeAll.
	suspectClues := aSuspect clues.
	countryClues := OrderedCollection new.
	aCollectionOfCountries do: [ :aCountry | countryClues add: aCountry clues ].
	
	witnesses add: (WitnessWithClues withClues: { countryClues at: 1 . countryClues at: 2  }).
	witnesses add: (WitnessWithClues withClues: { suspectClues at: 1 . suspectClues at: 2  }).
	witnesses add: (WitnessWithClues withClues: { suspectClues at: 3 . suspectClues at: 4  }).
	! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:25:57'!
hasCluelessWitnesses
	^ witnesses allSatisfy: [ :aWitness | aWitness hasClues. ]! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 20:01:45'!
isBorderingCountry: aCountry 
	^ borderingCountries includes: aCountry ! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 16:21:26'!
reductionTimeByTravelingToBorderingCountry

	^ 3! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 16:21:42'!
reductionTimeByTravelingToNotBorderingCountry

	^ 0! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 16:21:42'!
reductionTimeOfTravellingTo: aCountry 
	^ ( self isBorderingCountry: aCountry )
		ifTrue: [ self reductionTimeByTravelingToBorderingCountry ]
		ifFalse: [ self reductionTimeByTravelingToNotBorderingCountry ]! !

!Country methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 12:35:11'!
witnesses
	^ witnesses! !


!Country methodsFor: 'initialization' stamp: 'las 12/6/2020 18:31:37'!
initializeWithName: aName andClues: aCollectionOfClues 
	name := aName.
	clues := aCollectionOfClues.
	witnesses := OrderedCollection with: WitnessWithoutClues new with: WitnessWithoutClues new with: WitnessWithoutClues new.
	borderingCountries := Set new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Country class' category: #'CarmenSandiego-Model'!
Country class
	instanceVariableNames: ''!

!Country class methodsFor: 'instance creation' stamp: 'las 11/10/2020 12:33:53'!
withName: aName andClues: aCollectionOfClues 
	^self new initializeWithName: aName andClues: aCollectionOfClues ! !


!classDefinition: #Detective category: #'CarmenSandiego-Model'!
Object subclass: #Detective
	instanceVariableNames: 'remainingTime currentCountry clues state suspects'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:20:50'!
addClue: aClue 
	clues add: aClue! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:20:55'!
askTo: aWitness
	self validateWitness: aWitness.
	aWitness giveClueTo: self.
	self decreaseTimeBy: self penaltyTimeForAskingClues.! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/4/2020 11:39:15'!
clues
	^ clues copy! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:21:08'!
decreaseTimeBy: aNumberOfHours
	remainingTime := remainingTime - aNumberOfHours.
	self runOutOfTime ifTrue: [ state := LostState new ]! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 19:47:04'!
decreaseTimeByTraveling: aCountry
	self decreaseTimeBy: self penaltyTimeForTravelling - (aCountry reductionTimeOfTravellingTo: currentCountry)! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 18:53:09'!
emitWarrant: aSuspect

	(self hasSuspect: aSuspect ) ifFalse: [ self error: Detective notValidSuspectMessage ].

	state := aSuspect state! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 18:52:22'!
hasSuspect: aSuspect

	^ suspects includes: aSuspect! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:48:15'!
isValidInitialTime: aNumberOfHours

	^ aNumberOfHours < self minimumInitialTime ! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:46:23'!
minimumInitialTime

	^ self  penaltyTimeForAskingClues ! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:34:01'!
penaltyTimeForAskingClues
	self subclassResponsibility ! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 19:29:00'!
penaltyTimeForTravelling
	self subclassResponsibility ! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:21:29'!
remainingTime
	^remainingTime! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 20:09:19'!
result
	^ state result! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:21:46'!
runOutOfTime

	^ remainingTime = 0! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:41:01'!
throwInitialTimeIsNotValidError
	self error: (Detective notValidInitialTimeMessage: self minimumInitialTime ).! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:32:02'!
throwStartingCountryWithCluelessWitnessesError

	^ self error:  Detective startingCountryHasCluelessWitnessesMessage.! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 19:46:27'!
travelTo: aCountry
	self decreaseTimeByTraveling: aCountry.
	currentCountry := aCountry.	! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:39:17'!
validateInitialTime: aNumberOfHours
	(self isValidInitialTime: aNumberOfHours) ifTrue: [self throwInitialTimeIsNotValidError]! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:30:20'!
validateStartingCountry: aCountry

	^ aCountry hasCluelessWitnesses ifFalse: [self throwStartingCountryWithCluelessWitnessesError]! !

!Detective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:21:59'!
validateWitness: aWitness

	^ (aWitness isFrom: currentCountry)
		ifFalse: [ self error: ClassicDetective witnessIsNotInCurrentCountryMessage ]! !


!Detective methodsFor: 'initialization' stamp: 'las 12/6/2020 19:34:44'!
initializeWithInitialTime: aNumberOfHours startsIn: aCountry withSuspects: aCollectionOfSuspects
	
	self validateStartingCountry: aCountry.
	self validateInitialTime: aNumberOfHours.
	
	
	remainingTime := aNumberOfHours.
	currentCountry := aCountry.
	clues := OrderedCollection new.
	state := ProgressState new.
	suspects := aCollectionOfSuspects.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Detective class' category: #'CarmenSandiego-Model'!
Detective class
	instanceVariableNames: ''!

!Detective class methodsFor: 'instance creation' stamp: 'las 11/20/2020 18:48:16'!
withInitialTime: aNumberOfHours startsIn: aCountry withSuspects: aCollectionOfSuspects
	^self new initializeWithInitialTime: aNumberOfHours startsIn: aCountry withSuspects: aCollectionOfSuspects ! !


!Detective class methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:40:36'!
notValidInitialTimeMessage: aMinimumInitialTime
	^ 'Detective must start with time greater than ', aMinimumInitialTime asString! !

!Detective class methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 18:53:58'!
notValidSuspectMessage
	^ 'The suspect is not in list'! !

!Detective class methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:31:50'!
startingCountryHasCluelessWitnessesMessage
	^ 'Detective can not start in a country with witnesses without clues.'! !

!Detective class methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:31:08'!
witnessIsNotInCurrentCountryMessage
	^ 'Witness is not in current country'! !


!classDefinition: #ClassicDetective category: #'CarmenSandiego-Model'!
Detective subclass: #ClassicDetective
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!ClassicDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:34:35'!
penaltyTimeForAskingClues
	^ 2! !

!ClassicDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:36:46'!
penaltyTimeForTravelling
	^ 10! !


!classDefinition: #InterpolDetective category: #'CarmenSandiego-Model'!
Detective subclass: #InterpolDetective
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!InterpolDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:32:08'!
penaltyTimeForAskingClues
	^ 2! !

!InterpolDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 19:29:18'!
penaltyTimeForTravelling
	^ 8! !


!classDefinition: #PersuasiveDetective category: #'CarmenSandiego-Model'!
Detective subclass: #PersuasiveDetective
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!PersuasiveDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 21:50:33'!
askTo: aWitness
	self validateWitness: aWitness.
	aWitness giveAllCluesTo: self.
	self decreaseTimeBy: self penaltyTimeForAskingClues.! !

!PersuasiveDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:24:04'!
penaltyTimeForAskingClues
	^ 1! !

!PersuasiveDetective methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 19:29:30'!
penaltyTimeForTravelling
	^ 10! !


!classDefinition: #State category: #'CarmenSandiego-Model'!
Object subclass: #State
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!State methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 18:07:18'!
result
	self subclassResponsibility ! !


!classDefinition: #LostState category: #'CarmenSandiego-Model'!
State subclass: #LostState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!LostState methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 17:57:21'!
result
	^ 'lost'! !


!classDefinition: #ProgressState category: #'CarmenSandiego-Model'!
State subclass: #ProgressState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!ProgressState methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 17:54:32'!
result
	^ 'progress'! !


!classDefinition: #WonState category: #'CarmenSandiego-Model'!
State subclass: #WonState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!WonState methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 17:56:19'!
result
	^ 'won'! !


!classDefinition: #Suspect category: #'CarmenSandiego-Model'!
Object subclass: #Suspect
	instanceVariableNames: 'attributes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!Suspect methodsFor: 'initialization' stamp: 'las 11/10/2020 16:15:11'!
initializeWithEyeColor: anEyeColor hairShape: aHairShape hairColor: aHairColor bodyType: aBodyType gender: aGender height: aHeight
	attributes := Dictionary new.
	
	attributes at: 'eye color' put: anEyeColor.
	attributes at: 'hair shape' put: aHairShape.
	attributes at: 'hair color' put: aHairColor.
	attributes at: 'body type' put: aBodyType.
	attributes at: 'gender' put: aGender.
	attributes at: 'height' put: aHeight! !

!Suspect methodsFor: 'initialization' stamp: 'las 11/10/2020 18:07:03'!
state
	self subclassResponsibility ! !


!Suspect methodsFor: 'as yet unclassified' stamp: 'las 11/23/2020 19:31:51'!
clues
	| clues |
	clues := OrderedCollection new.
	attributes keys do: [  :attribute | clues add: (attributes at: attribute ),' ',attribute ].
	^ clues shuffled
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Suspect class' category: #'CarmenSandiego-Model'!
Suspect class
	instanceVariableNames: ''!

!Suspect class methodsFor: 'instance creation' stamp: 'las 11/10/2020 14:07:38'!
withEyeColor: anEyeColor hairShape: aHairShape hairColor: aHairColor bodyType: aBodyType gender: aGender height: aHeight 
	^self new initializeWithEyeColor: anEyeColor hairShape: aHairShape hairColor: aHairColor bodyType: aBodyType gender: aGender height: aHeight ! !


!classDefinition: #GuiltySuspect category: #'CarmenSandiego-Model'!
Suspect subclass: #GuiltySuspect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!GuiltySuspect methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 17:56:36'!
state
	^ WonState new.! !


!classDefinition: #NoGuiltySuspect category: #'CarmenSandiego-Model'!
Suspect subclass: #NoGuiltySuspect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!NoGuiltySuspect methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 17:57:05'!
state
	^ LostState new! !


!classDefinition: #Witness category: #'CarmenSandiego-Model'!
Object subclass: #Witness
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!Witness methodsFor: 'as yet unclassified' stamp: 'las 11/20/2020 17:40:32'!
giveAllCluesTo: aDetective 
	self subclassResponsibility ! !

!Witness methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 19:04:36'!
giveClueTo: aDetective 
	self subclassResponsibility ! !

!Witness methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 12:40:33'!
hasClues
	self subclassResponsibility ! !

!Witness methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 13:07:00'!
isFrom: aCountry 
	^ aCountry witnesses includes: self! !

!Witness methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 18:45:22'!
validateIfWitnessCanReturnClue
	self subclassResponsibility ! !


!classDefinition: #WitnessWithClues category: #'CarmenSandiego-Model'!
Witness subclass: #WitnessWithClues
	instanceVariableNames: 'clues'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!WitnessWithClues methodsFor: 'initialization' stamp: 'las 11/9/2020 18:17:01'!
initializeWithClues: aCollectionOfClues 
	clues := aCollectionOfClues asOrderedCollection.! !


!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 18:52:36'!
anyClue
	| aClue |
	aClue := (clues shuffled) at: 1.
	clues remove: aClue.
	^ aClue! !

!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 18:35:26'!
clue
	self validateIfWitnessCanReturnClue.
	^ self anyClue! !

!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 11/18/2020 19:19:22'!
giveAllCluesTo: aDetective 
	aDetective addClue: (self clue).
	aDetective addClue: (self clue).
	clues removeAll ! !

!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 18:53:06'!
giveClueTo: aDetective 
	aDetective addClue: self clue.! !

!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 18:33:36'!
hasClues
	^ (clues size = 0) not! !

!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:29:43'!
throwWitnessWithNoMoreCluesError

	^ self error: WitnessWithClues noMoreCluesMessage! !

!WitnessWithClues methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:29:43'!
validateIfWitnessCanReturnClue
	^ self hasClues ifFalse: [ self throwWitnessWithNoMoreCluesError  ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WitnessWithClues class' category: #'CarmenSandiego-Model'!
WitnessWithClues class
	instanceVariableNames: ''!

!WitnessWithClues class methodsFor: 'instance creation' stamp: 'las 11/8/2020 18:56:02'!
withClues: aCollectionOfClues 
	^self new initializeWithClues: aCollectionOfClues ! !


!WitnessWithClues class methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 18:40:23'!
noMoreCluesMessage
	^ 'Witness has no more clues'! !


!classDefinition: #WitnessWithoutClues category: #'CarmenSandiego-Model'!
Witness subclass: #WitnessWithoutClues
	instanceVariableNames: 'asked'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CarmenSandiego-Model'!

!WitnessWithoutClues methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 18:46:52'!
giveAllCluesTo: aDetective 
	self giveClueTo: aDetective.! !

!WitnessWithoutClues methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 18:47:09'!
giveClueTo: aDetective
	self validateIfWitnessCanReturnClue.
	asked := true.! !

!WitnessWithoutClues methodsFor: 'as yet unclassified' stamp: 'las 11/10/2020 12:39:46'!
hasClues
	^ false! !

!WitnessWithoutClues methodsFor: 'as yet unclassified' stamp: 'las 11/9/2020 18:58:45'!
initialize
	asked := false! !

!WitnessWithoutClues methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:29:12'!
throwReAskedWitnessError

	^ self error: WitnessWithoutClues hasBeenAlreadyAskedMessage! !

!WitnessWithoutClues methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 19:29:13'!
validateIfWitnessCanReturnClue
	asked ifTrue: [ self throwReAskedWitnessError. ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WitnessWithoutClues class' category: #'CarmenSandiego-Model'!
WitnessWithoutClues class
	instanceVariableNames: ''!

!WitnessWithoutClues class methodsFor: 'as yet unclassified' stamp: 'las 12/6/2020 18:44:41'!
hasBeenAlreadyAskedMessage
	^ 'Witness has been already asked'! !
