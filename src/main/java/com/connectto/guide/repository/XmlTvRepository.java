package com.connectto.guide.repository;

import com.connectto.guide.entity.XmlTv;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface XmlTvRepository extends JpaRepository<XmlTv, Long>
{

}