package com.suibianshuo.serviceImpl.mobile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suibianshuo.entity.mobile.GameConfig;
import com.suibianshuo.mybatis.mapper.GameConfigDao;
import com.suibianshuo.service.mobile.GameConfigService;

@Service
public class GameConfigServiceImpl implements GameConfigService{
	@Autowired
    private GameConfigDao gameConfigDao;

	@Override
	public List<GameConfig> getGameConfig(GameConfig gameConfig) {
		// TODO Auto-generated method stub
		return gameConfigDao.getGameConfig(gameConfig);
	}

	@Override
	public int addGameConfig(GameConfig gameConfig) {
		// TODO Auto-generated method stub
		return gameConfigDao.addGameConfig(gameConfig);
	}

	@Override
	public int updateGameConfig(GameConfig gameConfig) {
		// TODO Auto-generated method stub
		return gameConfigDao.updateGameConfig(gameConfig);
	}

	@Override
	public int deleteGameConfig(int id) {
		// TODO Auto-generated method stub
		return gameConfigDao.deleteGameConfig(id);
	}

	
}