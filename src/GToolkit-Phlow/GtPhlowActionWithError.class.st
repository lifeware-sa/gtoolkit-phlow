Class {
	#name : #GtPhlowActionWithError,
	#superclass : #GtPhlowAction,
	#instVars : [
		'error'
	],
	#category : 'GToolkit-Phlow'
}

{ #category : #accessing }
GtPhlowActionWithError >> asElementDo: aBlock withElement: aTargetElement [
	| debugButton |
	debugButton := BrButton new.
	debugButton look: BrMaterialToggleIconifiedLook + BrMaterialToggleLabelledLook.
	debugButton label: 'Debug'.
	debugButton action: [ [error defaultAction] fork ].
	^ aBlock value: debugButton
]

{ #category : #accessing }
GtPhlowActionWithError >> error [
	^ error
]

{ #category : #accessing }
GtPhlowActionWithError >> error: anObject [
	error := anObject
]