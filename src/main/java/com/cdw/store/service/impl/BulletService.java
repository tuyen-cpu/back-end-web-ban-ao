package com.cdw.store.service.impl;

import com.cdw.store.dto.BulletinDto;
import com.cdw.store.model.Bulletin;
import com.cdw.store.repo.BulletRepo;
import com.cdw.store.service.IBulletinService;
import com.cdw.store.utils.BulletinConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class BulletService implements IBulletinService {
    @Autowired
    private BulletRepo bulletRepo;
    @Autowired
    private BulletinConverter bulletinConverter;
    @Override
    public List<BulletinDto> getAll() {
        return bulletRepo.findAll().stream().map(e->bulletinConverter.convertToDto(e)).collect(Collectors.toList());

    }

    @Override
    public List<BulletinDto> getByUserId(Long id) {
        return bulletRepo.findByUserIdAndStatus(id,0).stream().map(e->bulletinConverter.convertToDto(e)).collect(Collectors.toList());

    }

    @Override
    public void update(BulletinDto bulletinDto) {
        bulletRepo.save(bulletinConverter.convertToEntity(bulletinDto));
    }
}
