Class {
	#name : #GtPhlowBuildContext,
	#superclass : #GtPhlowAbstractBuildContext,
	#instVars : [
		'object',
		'arguments'
	],
	#category : #'GToolkit-Phlow-Context'
}

{ #category : #factory }
GtPhlowBuildContext class >> null [
	^ GtPhlowBuildNullContext default
]

{ #category : #accessing }
GtPhlowBuildContext >> arguments [
	^ arguments
]

{ #category : #accessing }
GtPhlowBuildContext >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
GtPhlowBuildContext >> object [
	^ object
]

{ #category : #accessing }
GtPhlowBuildContext >> object: anObject [
	object := anObject
]