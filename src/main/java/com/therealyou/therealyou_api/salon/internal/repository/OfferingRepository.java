package com.therealyou.therealyou_api.salon.internal.repository;

import com.therealyou.therealyou_api.salon.internal.model.Offering;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OfferingRepository extends JpaRepository<Offering, UUID> {

    List<Offering> findBySalon_Id(UUID salonId);
}
