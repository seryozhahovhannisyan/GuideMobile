package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.exception.PermissionDeniedException;
import com.connectto.guide.common.util.CollectionHelper;
import com.connectto.guide.entity.FavoriteBlock;
import com.connectto.guide.repository.ContainerCustomRepository;
import com.connectto.guide.repository.FavoriteBlockRepository;
import com.connectto.guide.service.FavoriteBlockManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional(readOnly = true)
public class FavoriteBlockManagerImpl implements FavoriteBlockManager {

    @Autowired
    private FavoriteBlockRepository favoriteBlockDao;

//    @Autowired
//    private IChannelCustomRepository channelDao;

    @Autowired
    private ContainerCustomRepository containerCustomRepository;

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void favorite(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException {
        int channelId = favoriteBlock.getChannelId();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", favoriteBlock.getPartitionId());
        params.put("userId", favoriteBlock.getUserId());
        params.put("channelId", channelId);

        try {

            boolean isChannelExists = true;//channelDao.isChannelExists(channelId);
            if(!isChannelExists){
                throw new PermissionDeniedException("Could not found channel, incorrect id" + channelId) ;
            }

            List<FavoriteBlock> exists = null;//containerCustomRepository.getByParams(ValueOption.EQUAL.getName(), params);
            if (CollectionHelper.isEmpty(exists)) {
                favoriteBlockDao.save(favoriteBlock);
            } else {
                Long  id = exists.get(0).getId();
                favoriteBlockDao.updateFavorite(id, 1 , new Date(System.currentTimeMillis()));
            }
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void unFavorite(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException {
        int channelId = favoriteBlock.getChannelId();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", favoriteBlock.getPartitionId());
        params.put("userId", favoriteBlock.getUserId());
        params.put("channelId", channelId);

        try {

            boolean isChannelExists =  true;//channelDao.isChannelExists(channelId);
            if(!isChannelExists){
                throw new PermissionDeniedException("Could not found channel, incorrect id" + channelId) ;
            }

            List<FavoriteBlock> exists = null;//containerCustomRepository.getByParams(ValueOption.EQUAL.getName(), params);
            if (CollectionHelper.isEmpty(exists)) {
                favoriteBlockDao.save(favoriteBlock);
            } else {
                Long id = exists.get(0).getId();
                favoriteBlockDao.updateFavorite(id, 0 , new Date(System.currentTimeMillis()));
            }
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void block(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException {

        int channelId = favoriteBlock.getChannelId();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", favoriteBlock.getPartitionId());
        params.put("userId", favoriteBlock.getUserId());
        params.put("channelId", channelId);

        try {

            boolean isChannelExists =  true;//channelDao.isChannelExists(channelId);
            if(!isChannelExists){
                throw new PermissionDeniedException("Could not found channel, incorrect id" + channelId) ;
            }

            List<FavoriteBlock> exists = null;//containerCustomRepository.getByParams(ValueOption.EQUAL.getName(), params);
            if (CollectionHelper.isEmpty(exists)) {
                favoriteBlockDao.save(favoriteBlock);
            } else {

                if(exists.get(0).getBlock() != null && exists.get(0).getBlock() > 0){
                    throw new PermissionDeniedException("Could not block channel as channel already is blocked");
                }

                long id = exists.get(0).getId();
                favoriteBlockDao.updateBlock(id, 1, favoriteBlock.getBlockPassword() , new Date(System.currentTimeMillis()));
            }
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void unblock(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException {

        int channelId = favoriteBlock.getChannelId();

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("partitionId", favoriteBlock.getPartitionId());
        params.put("userId", favoriteBlock.getUserId());
        params.put("channelId", channelId);

        try {

            boolean isChannelExists =  true;//channelDao.isChannelExists(channelId);
            if(!isChannelExists){
                throw new PermissionDeniedException("Could not found channel, incorrect id" + channelId) ;
            }

            List<FavoriteBlock> exists = null;//containerCustomRepository.getByParams(ValueOption.EQUAL.getName(),params);
            if (CollectionHelper.isEmpty(exists)) {
                throw new DataNotFoundException("Could not unblock channel as channel not blocked");
            } else {

                if(exists.get(0).getBlock()== null || exists.get(0).getBlock() < 1){
                    throw new PermissionDeniedException("Could not unblock channel as channel already is unblocked");
                }

                if (!favoriteBlock.getBlockPassword().equals(exists.get(0).getBlockPassword())) {
                    throw new PermissionDeniedException("Could not unblock as incorrect password");
                }

                long id = exists.get(0).getId();
                favoriteBlockDao.updateBlock(id, 0, "" , new Date(System.currentTimeMillis()));
            }
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

}