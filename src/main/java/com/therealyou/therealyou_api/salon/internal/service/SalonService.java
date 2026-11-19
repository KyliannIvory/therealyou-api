package com.therealyou.therealyou_api.salon.internal.service;

import com.therealyou.therealyou_api.salon.SalonDto;
import com.therealyou.therealyou_api.salon.internal.mapper.SalonMapper;
import com.therealyou.therealyou_api.salon.internal.repository.SalonRepository;
import java.util.Optional;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class SalonService {

    private final SalonRepository repo;
    private final SalonMapper mapper;

    public Optional<SalonDto> findById(UUID salonId) {
        return repo.findById(salonId).map(mapper::toDto);
    }

}
