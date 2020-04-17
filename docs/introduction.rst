############
Introduction
############

**********
Motivation
**********

REpresentational State Transfer APIs expose their functionality
through combinations of fairly coarse primitives that generally
revolve around the use of transferring data in a standard exchange
format (such as JSON) using HTTP methods and other aspects of the very
simple HTTP protocol. Tests for such an API can therefore be defined
using a domain specific language (DSL) built around those higher level
ideas rather than requiring a general purpose language (the equivalent
of scripted `curl` commands with some glue code and assertions).
This project provides such a DSL by using select libraries
integrated into Cucumber, where Cucumber provides a test-oriented
framework for DSL creation.

************
Sample Usage
************

The general usage pattern revolves around construction of a request
and performing assertions against the received response.

.. code-block:: gherkin

   When the request body is assigned:
     """
     {"first_name": "John",
      "last_name": "Smith"}
     """
   And a POST is sent to `/users`
   Then the value of the response status is equal to `201`
   And the value of the response body is including:
     """
     {"first_name": "John",
      "last_name": "Smith"}
     """

************
Key Features
************

Request Construction and Response Assertion Step Definitions
	The most essential feature is that which is menthoed above: the ability
	to issue constructed requests and validate responses. The other features
	largely supplement this core functionality to support a wider range of
	use cases.

Variable Binding/Expansion
	To support cases where dynamic data is in the response or is desired for the
	request, values can be bound to identifiers which can then be
	expanded using `Mustache <http://mustache.github.io>`_ templates in
	your feature files.

Type Conversion and Coercion
	Different types of data can be expressed directly in the feature files
	or expanded into variables by using the appropriate syntax for that type.
	A facility it coerce types to allow more intelligent comparison of calues
	is also provided. This allows for implicit conversion of simpler values
	(normally strings) when paired with an operand of a richer type
	(such as a date/time).

:ref:`resource_cleanup`
	Tests are likely to create resources which should then be cleaned up
	so that the system can be restored to its pre-test state.
	Steps to facilitate this are provided.

Common Client Behavior
	Clients can be configured to adopt standard behavior such as adding
	headers to satisfy security requirements.

Definition of Reusable Actions
	Rather than executing actions immediately they can be stored for
	subsequent evaluation. This is currently used to support polling
	behavior to allow for delayed convergence (such as when using eventually
	consistent systems), but the mechnism can be extended to provide a
	range of functionality.
