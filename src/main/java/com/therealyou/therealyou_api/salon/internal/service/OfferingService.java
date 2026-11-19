package com.therealyou.therealyou_api.salon.internal.service;

import com.therealyou.therealyou_api.salon.OfferingDto;
import com.therealyou.therealyou_api.salon.internal.mapper.OfferingMapper;
import com.therealyou.therealyou_api.salon.internal.repository.OfferingRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class OfferingService {

    private final OfferingRepository repo;
    private final OfferingMapper mapper;

    public Optional<OfferingDto> findById(UUID offeringId) {
        return repo.findById(offeringId).map(mapper::toDto);
    }

    public List<OfferingDto> findBySalonId(UUID salonId) {
        return mapper.toDtos(repo.findBySalon_Id(salonId));
    }
}
