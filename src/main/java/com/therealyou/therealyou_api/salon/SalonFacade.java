package com.therealyou.therealyou_api.salon;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface SalonFacade {

    Optional<SalonDto> findSalon(UUID salonId);

    Optional<OfferingDto> findOffering(UUID offeringId);

    List<OfferingDto> findOfferingsBySalonId(UUID salonId);
}
