CLASS LHC_CONNECTION DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Connection
        RESULT result,
      CheckSemanticKey FOR VALIDATE ON SAVE
            IMPORTING keys FOR Connection~CheckSemanticKey.
ENDCLASS.

CLASS LHC_CONNECTION IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD CheckSemanticKey.


     READ ENTITIES OF z0044__r_connection IN LOCAL MODE
            ENTITY Connection
            FIELDS ( CarrierID ConnectionID )
              WITH CORRESPONDING #( keys )
            RESULT DATA(connections).


  LOOP AT connections into data(connection).
    SELECT FROM z0044aconn
           FIELDS uuid
            WHERE carrier_id    = @connection-CarrierID
              AND connection_id = @connection-ConnectionID
              AND uuid          <> @connection-uuid
      UNION
      SELECT FROM z0044dconn
           FIELDS uuid
            WHERE carrierid     = @connection-CarrierID
              AND connectionid  = @connection-ConnectionID
              and uuid          <> @connection-uuid

       INTO TABLE @DATA(check_result).



     IF check_result IS NOT INITIAL.

        DATA(message) = me->new_message(
                          id       = 'ZS4D400'
                          number   = '001'
                          severity = ms-error
                          v1       = connection-CarrierID
                          v2       = connection-ConnectionID
                        ).


        DATA reported_record LIKE LINE OF reported-connection.

        reported_record-%tky = connection-%tky.
        reported_record-%msg = message.
        reported_record-%element-CarrierID    = if_abap_behv=>mk-on.
        reported_record-%element-ConnectionID = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-connection.


        DATA failed_record like line of failed-connection.

        failed_record-%tky = connection-%tky.
        APPEND failed_record TO failed-connection.

      ENDIF.
    ENDLOOP.



  ENDMETHOD.

ENDCLASS.
