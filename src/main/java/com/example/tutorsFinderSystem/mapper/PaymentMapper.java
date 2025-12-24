package com.example.tutorsFinderSystem.mapper;

import com.example.tutorsFinderSystem.dto.response.TransactionResponse;
import com.example.tutorsFinderSystem.entities.Payment;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring")
public interface PaymentMapper {

    PaymentMapper INSTANCE = Mappers.getMapper(PaymentMapper.class);

    @Mapping(target = "transactionCode", source = "paymentId", qualifiedByName = "mapTransactionCode")
    @Mapping(target = "tutorName", source = "classRequest.tutor.user.fullName")
    @Mapping(target = "learnerName", source = "classRequest.learner.fullName")
    @Mapping(target = "subjectName", source = "classRequest.subject.subjectName")
    @Mapping(target = "amount", source = "amount")
    @Mapping(target = "status", source = "paymentStatus")
    @Mapping(target = "createdAt", source = "createdAt")
    TransactionResponse toTransactionResponse(Payment payment);

    @Named("mapTransactionCode")
    default String mapTransactionCode(Long paymentId) {
        return "#TX-" + paymentId;
    }

}
