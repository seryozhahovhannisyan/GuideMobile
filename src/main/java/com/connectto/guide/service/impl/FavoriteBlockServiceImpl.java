package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.exception.PermissionDeniedException;
import com.connectto.guide.common.util.CollectionHelper;
import com.connectto.guide.common.util.QueryConstant;
import com.connectto.guide.common.util.QueryParam;
import com.connectto.guide.entity.FavoriteBlock;
import com.connectto.guide.repository.ChannelRepository;
import com.connectto.guide.repository.FavoriteBlockRepository;
import com.connectto.guide.service.FavoriteBlockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class FavoriteBlockServiceImpl implements FavoriteBlockService {

    @Autowired
    private FavoriteBlockRepository repository;

    @Autowired
    private ChannelRepository channelRepository;

//    @Autowired
//    private ContainerCustomRepository<FavoriteBlock,Long> customRepository;

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void favorite(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException {
        long channelId = favoriteBlock.getChannelId();

        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", favoriteBlock.getPartitionId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("user_id", favoriteBlock.getUserId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("channel_id", channelId, QueryConstant.EQUAL));

        try {

            long count = channelRepository.countByChannelId(channelId);
            if (count < 1) {
                throw new DataNotFoundException("Could not found channel, incorrect channelId " + channelId);
            }

            List<FavoriteBlock> exists = repository.getByUserIdAndChannelId(favoriteBlock.getUserId(), channelId);
            if (CollectionHelper.isEmpty(exists)) {
                repository.save(favoriteBlock);
            } else {
                Long id = exists.get(0).getId();
                repository.updateFavorite(id, 1, new Date(System.currentTimeMillis()));
            }
        } catch (DataNotFoundException e) {
            throw new DataNotFoundException(e);
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void unFavorite(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException {

        long channelId = favoriteBlock.getChannelId();

        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", favoriteBlock.getPartitionId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("user_id", favoriteBlock.getUserId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("channel_id", channelId, QueryConstant.EQUAL));

        try {

            long count = channelRepository.countByChannelId(channelId);
            if (count < 1) {
                throw new DataNotFoundException("Could not found channel, incorrect channelId " + channelId);
            }

            List<FavoriteBlock> exists = repository.getByUserIdAndChannelId(favoriteBlock.getUserId(), channelId);
            if (CollectionHelper.isEmpty(exists)) {
                repository.save(favoriteBlock);
            } else {
                Long id = exists.get(0).getId();
                repository.updateFavorite(id, 0, new Date(System.currentTimeMillis()));
            }
        } catch (DataNotFoundException e) {
            throw new DataNotFoundException(e);
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void block(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException {

        long channelId = favoriteBlock.getChannelId();

        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", favoriteBlock.getPartitionId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("user_id", favoriteBlock.getUserId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("channel_id", channelId, QueryConstant.EQUAL));

        try {

            long count = channelRepository.countByChannelId(channelId);
            if (count < 1) {
                throw new DataNotFoundException("Could not found channel, incorrect channelId " + channelId);
            }

            List<FavoriteBlock> exists = repository.getByUserIdAndChannelId(favoriteBlock.getUserId(), channelId);
            if (CollectionHelper.isEmpty(exists)) {
                repository.save(favoriteBlock);
            } else {

                if (exists.get(0).getBlock() != null && exists.get(0).getBlock() > 0) {
                    throw new PermissionDeniedException("Could not block channel as channel already is blocked");
                }

                long id = exists.get(0).getId();
                repository.updateBlock(id, 1, favoriteBlock.getBlockPassword(), new Date(System.currentTimeMillis()));
            }
        } catch (DataNotFoundException e) {
            throw new DataNotFoundException(e);
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = Exception.class)
    public void unblock(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException {

        long channelId = favoriteBlock.getChannelId();

        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", favoriteBlock.getPartitionId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("user_id", favoriteBlock.getUserId(), QueryConstant.EQUAL));
        queryParams.add(new QueryParam("channel_id", channelId, QueryConstant.EQUAL));

        try {

            long count = channelRepository.countByChannelId(channelId);
            if (count < 1) {
                throw new DataNotFoundException("Could not found channel, incorrect channelId " + channelId);
            }

            List<FavoriteBlock> exists = repository.getByUserIdAndChannelId(favoriteBlock.getUserId(), channelId);
            if (CollectionHelper.isEmpty(exists)) {
                throw new DataNotFoundException("Could not unblock channel as channel not blocked");
            } else {

                if (exists.get(0).getBlock() == null || exists.get(0).getBlock() < 1) {
                    throw new PermissionDeniedException("Could not unblock channel as channel already is unblocked");
                }

                if (!favoriteBlock.getBlockPassword().equals(exists.get(0).getBlockPassword())) {
                    throw new PermissionDeniedException("Could not unblock as incorrect password");
                }

                long id = exists.get(0).getId();
                repository.updateBlock(id, 0, "", new Date(System.currentTimeMillis()));
            }
        } catch (DataNotFoundException e) {
            throw new DataNotFoundException(e);
        } catch (Exception e) {
            throw new InternalErrorException(e);
        }
    }

}