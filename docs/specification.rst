.. _specification:

#############
Specification
#############

The behavior of Brine is itself specified using Cucumber specs; these are intended to
provide examples for all of the provided steps, including representations of all
offered behavior and handling of edge and corner cases.  Additionally the specifications
are intended to facilitate porting of Brine to new runtimes as the same specifications
should be able to be used across those runtimes.

.. _spec_request_construction:

********************
Request Construction
********************

.. literalinclude:: ../features/request_construction/basic.feature
   :language: gherkin

.. literalinclude:: ../features/request_construction/body.feature
   :language: gherkin

.. literalinclude:: ../features/request_construction/params.feature
   :language: gherkin

.. literalinclude:: ../features/request_construction/headers.feature
   :language: gherkin

.. literalinclude:: ../features/request_construction/clearing.feature
   :language: gherkin

.. literalinclude:: ../features/request_construction/basic_auth.feature
   :language: gherkin
	      
.. _spec_client_configuration:

********************
Client Configuration
********************

.. literalinclude:: ../features/client_building/additional_headers.feature
   :language: gherkin

.. _spec_resource_cleanup:

****************
Resource Cleanup
****************

.. literalinclude:: ../features/resource_cleanup/cleanup.feature
   :language: gherkin

.. _spec_assignment:

**********
Assignment
**********

.. literalinclude:: ../features/assignment/parameter.feature
   :language: gherkin

.. literalinclude:: ../features/assignment/random.feature
   :language: gherkin

.. literalinclude:: ../features/assignment/timestamp.feature
   :language: gherkin

.. literalinclude:: ../features/assignment/response_attribute.feature
   :language: gherkin

.. literalinclude:: ../features/assignment/from_environment.feature
   :language: gherkin

.. _spec_selection:

*********
Selection
*********

.. literalinclude:: ../features/selection/response_attributes.feature
   :language: gherkin

.. literalinclude:: ../features/selection/any.feature
   :language: gherkin

.. literalinclude:: ../features/selection/all.feature
   :language: gherkin

.. _spec_assertion:

*********
Assertion
*********

.. literalinclude:: ../features/assertions/is_equal_to.feature
   :language: gherkin

.. literalinclude:: ../features/assertions/is_matching.feature
   :language: gherkin

.. literalinclude:: ../features/assertions/is_including.feature
   :language: gherkin

.. literalinclude:: ../features/assertions/is_empty.feature
   :language: gherkin

.. literalinclude:: ../features/assertions/is_of_length.feature
   :language: gherkin

.. literalinclude:: ../features/assertions/is_a_valid.feature
   :language: gherkin

.. _spec_actions:

*******
Actions
*******

.. _spec_eventually:

.. literalinclude:: ../features/actions/eventually.feature

.. _spec_argument_transformation:

***********************
Argument Transformation
***********************

.. literalinclude:: ../features/argument_transforms/boolean.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/datetime.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/integer.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/list.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/object.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/quoted.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/regex.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/template.feature
   :language: gherkin

.. literalinclude:: ../features/argument_transforms/whitespace.feature
   :language: gherkin

