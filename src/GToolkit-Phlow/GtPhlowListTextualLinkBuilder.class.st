Class {
	#name : #GtPhlowListTextualLinkBuilder,
	#superclass : #BrListItemElementStencilBuilder,
	#instVars : [
		'spawnObjectComputation'
	],
	#category : 'GToolkit-Phlow-Support - List'
}

{ #category : #'api - instantiation' }
GtPhlowListTextualLinkBuilder >> buildDefault [
	^ BrButton new
		aptitude: (BrGlamorousLinkButtonWithLabelAptitude new);
		alignCenterLeft;
		hMatchParent;
		vFitContent;
		action: [ :aButton :aButtonModel |
			| aCellObject anObjectToSpawn |
			
			"row index -> row object"
			aCellObject := aButtonModel model.
			
			anObjectToSpawn := spawnObjectComputation
				phlowValue: aCellObject value
				withEnoughArguments: { aCellObject value . aCellObject key }.
				
		aButton phlow spawnObject: anObjectToSpawn ]
]

{ #category : #initialization }
GtPhlowListTextualLinkBuilder >> initialize [
	super initialize.
	
	spawnObjectComputation := [ :aCellObject | aCellObject ]
]

{ #category : #accessing }
GtPhlowListTextualLinkBuilder >> spawnObjectComputation [

	^ spawnObjectComputation
]

{ #category : #accessing }
GtPhlowListTextualLinkBuilder >> spawnObjectComputation: anObject [

	spawnObjectComputation := anObject
]