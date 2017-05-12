package com.connectto.guide.service;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.exception.PermissionDeniedException;
import com.connectto.guide.entity.FavoriteBlock;

public interface FavoriteBlockService {

    public void favorite(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException;

    public void unFavorite(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException;

    public void block(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException;

    public void unblock(FavoriteBlock favoriteBlock) throws InternalErrorException, DataNotFoundException, PermissionDeniedException;

}