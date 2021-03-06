//  Copyright (c) 2014 Rob Rix. All rights reserved.

// MARK: Operators

infix operator |> {
	/// Associates to the left so that pipelines behave as expected.
	associativity left

	/// Minimal precedence.
	precedence 0
}

infix operator <| {
	/// Associates to the right so that pipelines behave as expected.
	associativity right

	/// Minimal precedence.
	precedence 0
}


// MARK: Forward function application

/// Forward function application.
///
/// Applies the function on the right to the value on the left. Functions of >1 argument can be applied by placing their arguments in a tuple on the left hand side.
public func |> <T, U> (left: T, right: T -> U) -> U {
	return right(left)
}


// MARK: Backward function application.

/// Backward function application.
///
/// Applies the function on the left to the value on the right. Functions of >1 argument can be applied by placing their arguments in a tuple on the right hand side.
public func <| <T, U> (left: T -> U, right: T) -> U {
	return left(right)
}
