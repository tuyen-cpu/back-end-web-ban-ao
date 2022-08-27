package com.cdw.store.service;

import com.cdw.store.dto.BulletinDto;
import com.cdw.store.model.Bulletin;

import java.util.List;

public interface IBulletinService {
    List<BulletinDto> getAll();
    List<BulletinDto> getByUserId(Long id);
    void add(BulletinDto bulletinDto);
    void update(BulletinDto bulletinDto);
}
