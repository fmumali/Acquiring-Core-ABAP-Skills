@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for Z0044__R_CONNECTION'
define root view entity Z0044_C_CONNECTION
  provider contract transactional_query
  as projection on Z0044__R_CONNECTION
{
  key UUID,
      @Consumption.valueHelpDefinition:
      [{ entity: { name: 'Z0044_I_CarrierVH',
                   element: 'CarrierID' }
                    }]
      CarrierID,
      ConnectionID,
      AirportFromID,
      CityFrom,
      CountryFrom,
      AirportToID,
      CityTo,
      CountryTo,
      LocalLastChangedAt

}
