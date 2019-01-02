package com.suibianshuo.mybatis.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.suibianshuo.entity.mobile.GameConfig;

@Repository
public interface GameConfigDao {
	//查询
	public List<GameConfig> getGameConfig(GameConfig gameConfig);
	//添加
	public int addGameConfig(GameConfig gameConfig);
    //更新
	public int updateGameConfig(GameConfig gameConfig);
    //删除
	public int deleteGameConfig(int id);
}
