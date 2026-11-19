package com.therealyou.therealyou_api.salon.internal;

import com.therealyou.therealyou_api.salon.OfferingDto;
import com.therealyou.therealyou_api.salon.SalonFacade;
import com.therealyou.therealyou_api.salon.SalonDto;
import com.therealyou.therealyou_api.salon.internal.service.OfferingService;
import com.therealyou.therealyou_api.salon.internal.service.SalonService;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SalonFacadeImpl implements SalonFacade {

    private final SalonService salonService;
    private final OfferingService offeringService;


    @Override
    public Optional<SalonDto> findSalon(UUID salonId) {
        return salonService.findById(salonId);
    }

    @Override
    public Optional<OfferingDto> findOffering(UUID offeringId) {
        return offeringService.findById(offeringId);
    }

    @Override
    public List<OfferingDto> findOfferingsBySalonId(UUID salonId) {
        return offeringService.findBySalonId(salonId);
    }
}
