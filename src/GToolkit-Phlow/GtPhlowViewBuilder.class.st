Class {
	#name : #GtPhlowViewBuilder,
	#superclass : #GtPhlowViewProtoBuilder,
	#traits : 'TGtPhlowViewAccessor + TGtPhlowContextAccessor',
	#classTraits : 'TGtPhlowViewAccessor classTrait + TGtPhlowContextAccessor classTrait',
	#instVars : [
		'object'
	],
	#category : #'GToolkit-Phlow-Collectors'
}

{ #category : #testing }
GtPhlowViewBuilder class >> isAbstract [
	^ self name = #GtPhlowViewBuilder 
]

{ #category : #actions }
GtPhlowViewBuilder >> actions [ 
	<return: #Array of: #GtPhlowAction>
	^ self object gtActions
]

{ #category : #actions }
GtPhlowViewBuilder >> addActionsInto: aView [
	self actions
		do: [ :action | 
			action isDefaultTarget
				ifTrue: [ aView addPhlowAction: action ] ]
]

{ #category : #building }
GtPhlowViewBuilder >> build [
	<return: #GtPhlowView>
	| aView |
	aView := self buildView.
	self addActionsInto: aView.
	^ aView
]

{ #category : #building }
GtPhlowViewBuilder >> buildView [
	<return: #GtPhlowView>
	^ self subclassResponsibility
]

{ #category : #initialization }
GtPhlowViewBuilder >> initialize [
	super initialize.
	self initializePhlowContext.
	self initializePhlowView.
]

{ #category : #factory }
GtPhlowViewBuilder >> labelled [
	^ GtPhlowLabelledViewBuilder new
		builder: self
]

{ #category : #accessing }
GtPhlowViewBuilder >> object [
	^ object
]

{ #category : #accessing }
GtPhlowViewBuilder >> object: anObject [
	"Set an object for which a view will be built"
	object := anObject
]