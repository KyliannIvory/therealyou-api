package com.therealyou.therealyou_api.salon.internal.repository;

import com.therealyou.therealyou_api.salon.internal.model.Salon;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SalonRepository extends JpaRepository<Salon, UUID> {
}
