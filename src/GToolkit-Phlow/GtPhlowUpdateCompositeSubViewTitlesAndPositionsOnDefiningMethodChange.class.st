"
I listen to system changes.
I change a ${class:BrTab}$ label and position of a changed ${class:GtPhlowView}$ subview definition in a given ${class:BrTabGroup}$ element.
See ${class:GtPhlowUpdateCompositeSubViewTitleAndPosition}$ for more details.

"
Class {
	#name : #GtPhlowUpdateCompositeSubViewTitlesAndPositionsOnDefiningMethodChange,
	#superclass : #GtPhlowSystemChangeUpdateDefinition,
	#traits : 'TGtPhlowCompositeViewAccessors',
	#classTraits : 'TGtPhlowCompositeViewAccessors classTrait',
	#category : #'GToolkit-Phlow-Updating'
}

{ #category : #accessing }
GtPhlowUpdateCompositeSubViewTitlesAndPositionsOnDefiningMethodChange >> assertContext: aGtPhlowElementContext [
	self 
		assert: [ aGtPhlowElementContext entity isKindOf: GtPhlowCompositeView ]
		description: [ GtPhlowCompositeView name, ' instance is expected' ]
]

{ #category : #'announcement handling' }
GtPhlowUpdateCompositeSubViewTitlesAndPositionsOnDefiningMethodChange >> handleMethodModifiedAnnouncement: aMethodModified [ 
	self hasContexts ifFalse: [ ^ self ].
	self views do: [ :eachView | 
		(eachView definingMethod isNotNil and: [ 
			eachView definingMethod gtPhlowIncludesCompiledMethod: aMethodModified methodAffected ]) ifTrue: [ 
				^ self updateSubView: eachView ] ].
]

{ #category : #subscriptions }
GtPhlowUpdateCompositeSubViewTitlesAndPositionsOnDefiningMethodChange >> subscribeOn: aGtPhlowElementContext [
	self addContext: aGtPhlowElementContext.
	self setSubscribedIfAlreadySubscribedDo: [ ^ self ].
	self
		subscribeAnnouncement: MethodModified
		send: #handleMethodModifiedAnnouncement:
		subscriber: self
]

{ #category : #updating }
GtPhlowUpdateCompositeSubViewTitlesAndPositionsOnDefiningMethodChange >> updateSubView: aGtPhlowView [
	self contexts do: [ :eachContext | 
		self updateSubView: aGtPhlowView inContext: eachContext ].
]

{ #category : #updating }
GtPhlowUpdateCompositeSubViewTitlesAndPositionsOnDefiningMethodChange >> updateSubView: aGtPhlowView inContext: aGtPhlowElementContext [
	self scheduleTask: (GtPhlowUpdateCompositeSubViewTitleAndPosition new
		elementContext: aGtPhlowElementContext;
		subView: aGtPhlowView)
]