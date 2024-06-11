package burrow_exporter

import (
	log "github.com/sirupsen/logrus"
)

func init() {
	// 기본 로그 레벨을 설정합니다 (예: Info 레벨)
	log.SetLevel(log.WarnLevel)
	log.SetFormatter(&log.TextFormatter{
		FullTimestamp: true,
	})
}